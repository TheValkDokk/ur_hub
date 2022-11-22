// ignore_for_file: unused_local_variable

import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ur_hub/models/steam/steam_user_owned_game.dart';
import 'package:ur_hub/panels/steam/widgets/steam_installed.dart';
import 'package:ur_hub/panels/steam/widgets/steam_tile.dart';
import 'package:ur_hub/services/steam_service.dart';
import 'package:window_size/window_size.dart';

import '../../../constrain/constrain.dart';
import '../../../models/steam/steam_game.dart';

class SteamMainPanel extends StatelessWidget {
  const SteamMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: const [
              Expanded(flex: 3, child: SteamMyGamePanel()),
              Expanded(
                flex: 5,
                child: SteamTopicPanel(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SteamTopicPanel extends StatelessWidget {
  const SteamTopicPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Panel",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SteamMyGamePanel extends StatelessWidget {
  const SteamMyGamePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        SteamService().getUserGames(),
        getCurrentScreen(),
        SteamService().getSteamUser(),
        SteamService().getOwnedGames()
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Lottie.asset('assets/loading/loading.json'));
        } else {
          Screen screen = snapshot.data![1] as Screen;
          double width = screen.visibleFrame.width;
          List<SteamGame> firstList = snapshot.data![0] as List<SteamGame>;
          List<SteamOwnedGame> playerOwnedGame =
              snapshot.data![3] as List<SteamOwnedGame>;
          List<SteamGame> tempList = listOnlyGame(firstList, playerOwnedGame);
          List<SteamGame> list = tempList;
          return Obx(() {
            if (appController.steamSearchTerm.value.isEmpty) {
              list = tempList;
            } else {
              list = appController.filterList();
            }
            appController.steamgames.value =
                snapshot.data![0] as List<SteamGame>;
            var bsList = appController.bsList;
            for (var i in bsList) {
              appController.steamgames.value
                  .removeWhere((element) => element.appID == i.toString());
            }

            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (list.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        Lottie.asset("assets/loading/empty.json"),
                        const Text(
                          "Empty",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                        child: SteamInstalled(
                      games: list,
                      owned: playerOwnedGame,
                    )),
                    Expanded(
                      child: AutoAnimatedList(
                        items: list,
                        shrinkWrap: true,
                        itemBuilder: (context, game, index, animation) {
                          SteamOwnedGame g = SteamOwnedGame();
                          try {
                            g = playerOwnedGame.firstWhere((element) =>
                                element.appid == int.parse(game.appID!));
                          } catch (e) {}
                          return SizeFadeTransition(
                            animation: animation,
                            child: SteamTile(
                              game: game,
                              owned: g,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          });
        }
      },
    );
  }

  int calcCount(double w, double screen) {
    double result = w / screen;
    if (result < 0.4) {
      return 3;
    } else if (result < 0.7) {
      return 4;
    } else {
      return 5;
    }
  }

  List<SteamGame> listOnlyGame(
    List<SteamGame> sGames,
    List<SteamOwnedGame> steamOwned,
  ) {
    List<SteamGame> games = [];

    for (var x in steamOwned) {
      for (var e in sGames) {
        if (e.appID == x.appid.toString()) {
          games.add(e);
        }
      }
    }

    var bsList = appController.bsList;
    for (var i in bsList) {
      games.removeWhere((element) => element.appID == i.toString());
    }

    return games;
  }
}
