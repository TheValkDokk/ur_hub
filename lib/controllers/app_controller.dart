// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ur_hub/models/steam/steam_game.dart';
import 'package:ur_hub/models/steam/steam_game_detail.dart';
import 'package:ur_hub/models/user_settings.dart';
import 'package:ur_hub/services/steam_service.dart';
import '../constrain/constrain.dart';
import '../models/steam/steam_user.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();

  RxString userId = "".obs;
  RxInt selectedIndex = 0.obs;
  RxBool appInit = false.obs;
  RxList<SteamGame> steamgames = <SteamGame>[].obs;
  RxList<SteamGame> tempGames = <SteamGame>[].obs;
  RxString steamSearchTerm = "".obs;

  RxBool haveSteamUser = false.obs;

  List<int> bsList = [654310, 700580];

  Rx<UserSettings> userSettings = UserSettings(
    isFullScreen: false,
    isAutoStart: false,
    isSteamLogin: false,
    mainColor: mainColor,
    secondColor: secondColor,
  ).obs;

  @override
  void onInit() {
    ever(userId, (callback) {
      var u = SteamUser(customURL: callback);
      appController.userSettings.value =
          appController.userSettings.value.copyWith(steamUser: u);
    });
    appInit.value = false;
    try {
      userSettings.value.isFullScreen = box.read('isMaximize');
    } catch (e) {
      print(e);
      box.write('isMaximize', false);
      userSettings.value.isFullScreen = false;
    }
    super.onInit();
    generateRailList();
    appInit.value = true;
  }

  //OFFLINE FUNCTIONS
  void saveSteamListGame(List<SteamGame> list) {
    for (SteamGame game in list) {
      if (!steamgames.value.contains(game)) {
        steamgames.value.add(game);
      }
    }
    Map gameMap = {
      for (var game in steamgames.value) '${game.appID}': game.toMap()
    };

    box.write('steam-games', gameMap);
  }

  void loadSteamGameList() {
    var value = box.read('steam-games') as Map<String, dynamic>;
    value.forEach((k, v) async {
      SteamGame game = SteamGame.fromMap(v);
      SteamGameDetail gameDetail = await SteamService().getSteamGameDetail(k);
      game.steamGameDetail = gameDetail;
      steamgames.value.add(game);
    });
  }

  List<SteamGame> filterList() {
    if (steamSearchTerm.isEmpty) {
      return steamgames;
    }
    return steamgames
        .where((p0) => p0.name!
            .toLowerCase()
            .contains(steamSearchTerm.value.toLowerCase()))
        .toList();
  }

  Future<void> getDetail() async {
    for (var game in steamgames) {
      game.steamGameDetail =
          await SteamService().getSteamGameDetail(game.appID!);
    }
  }

  late RxList<NavigationRailDestination> railDestinationList;

  void generateRailList() {
    railDestinationList = [
      NavigationRailDestination(
        icon: Obx(
          () => CircleAvatar(
            backgroundColor:
                selectedIndex.value == 0 ? Colors.white : Colors.transparent,
            radius: 30,
            child: SvgPicture.asset(
              "assets/icons/steam.svg",
              semanticsLabel: 'Steam',
            ),
          ),
        ),
        label: const Text("Steam"),
      ),
      NavigationRailDestination(
        icon: Obx(
          () => CircleAvatar(
            backgroundColor:
                selectedIndex.value == 1 ? Colors.white : Colors.transparent,
            radius: 30,
            child: SvgPicture.asset(
              "assets/icons/origin.svg",
              semanticsLabel: 'Origin',
            ),
          ),
        ),
        label: const Text("Origin"),
      ),
      NavigationRailDestination(
        icon: Obx(
          () => CircleAvatar(
            backgroundColor:
                selectedIndex.value == 2 ? Colors.white : Colors.transparent,
            radius: 30,
            child: SvgPicture.asset(
              "assets/icons/steam.svg",
              semanticsLabel: 'Steam',
            ),
          ),
        ),
        label: const Text("Steam"),
      ),
    ].obs;
  }
}
