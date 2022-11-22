import 'dart:io';

import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ur_hub/models/steam/steam_game.dart';
import 'package:ur_hub/panels/steam/widgets/steam_tile.dart';
import 'package:win32_registry/win32_registry.dart';

import '../../../models/steam/steam_user_owned_game.dart';

class SteamInstalled extends StatelessWidget {
  const SteamInstalled({super.key, required this.games, required this.owned});

  final List<SteamGame> games;
  final List<SteamOwnedGame> owned;

  @override
  Widget build(BuildContext context) {
    Future<List<String>> getInstalled() async {
      final key = Registry.openPath(RegistryHive.localMachine,
          path: r"SOFTWARE\WOW6432Node\Valve\Steam");
      var path = key.getValueAsString('InstallPath');
      path = path!.replaceAll('\\', '\\\\');
      var file = File('$path\\steamapps\\libraryfolders.vdf');
      var json = await file.readAsString();
      List<String> ids = [];
      for (var x in games) {
        if (json.contains(x.appID!)) {
          ids.add(x.appID!);
        }
      }
      return ids;
    }

    return FutureBuilder(
      future: getInstalled(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Lottie.asset('assets/loading/loading.json');
        } else {
          var list = snapshot.data;
          return AutoAnimatedList(
            items: list,
            shrinkWrap: true,
            itemBuilder: (context, game, index, animation) {
              SteamOwnedGame g = SteamOwnedGame();
              try {
                g = owned.firstWhere(
                    (element) => element.appid == int.parse(game.toString()));
              } catch (e) {}
              return SizeFadeTransition(
                animation: animation,
                child: SteamTile(
                  game: games.firstWhere((element) => element.appID == game),
                  owned: g,
                ),
              );
            },
          );
        }
      },
    );
  }
}
