import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ur_hub/constrain/constrain.dart';
import 'package:ur_hub/models/steam/steam_game_detail.dart';
import 'package:ur_hub/models/steam/steam_user.dart';
import 'package:ur_hub/models/steam/steam_user_owned_game.dart';
import 'package:xml/xml.dart';

import '../models/steam/steam_game.dart';

class SteamService {
  Future<List<SteamGame>> getUserGames() async {
    String api = dotenv.env['STEAM_ID_API']!;
    String endpointUserGames = dotenv.env['STEAM_GET_USER_GAMES']!;
    try {
      var response = await Dio().get(
        api +
            appController.userSettings.value.steamUser!.customURL! +
            endpointUserGames,
        options: Options(
          method: "GET",
        ),
      );
      List<SteamGame> games = XmlDocument.parse(response.data)
          .findAllElements('game')
          .map((e) => SteamGame.fromXmlElement(e))
          .toList();

      return games;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SteamOwnedGame>> getOwnedGames() async {
    String api = dotenv.env['STEAM_GET_USER_OWNED_GAMES']!;
    api = api.replaceAll('XXXX', dotenv.env['STEAM_API_KEY']!);
    api = api.replaceAll('XXX',
        appController.userSettings.value.steamUser!.steamID64.toString());
    List<SteamOwnedGame> list = [];
    try {
      var response = await Dio().get(
        api,
        options: Options(
          method: "GET",
        ),
      );
      for (var x in response.data['response']['games']) {
        list.add(SteamOwnedGame.fromMap(x));
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  Future<int> getSteamUser() async {
    String api = dotenv.env['STEAM_ID_API']!;
    String endpointuser = dotenv.env['STEAM_GET_USER_INFO']!;
    try {
      var response = await Dio().get(
        api +
            appController.userSettings.value.steamUser!.customURL! +
            endpointuser,
        options: Options(
          method: "GET",
        ),
      );

      var data = XmlDocument.parse(response.data);

      if (data.getElement("error") != null) {
        return 0;
      }

      SteamUser u = SteamUser.fromXmlElement(data.rootElement);

      appController.userSettings.value =
          appController.userSettings.value.copyWith(steamUser: u);
    } catch (e) {
      print(e);
    }
    return 1;
  }

  Future<SteamGameDetail> getSteamGameDetail(String id) async {
    String endpointGameDetail = dotenv.env['STEAM_GET_GAME']!;
    var response = await Dio().get(endpointGameDetail + id.toString());
    if (((response.data as Map<String, dynamic>)[id]['success'] as bool) ==
        true) {
      return SteamGameDetail.fromMap(
          (response.data as Map<String, dynamic>)[id]['data']);
    } else {
      return SteamGameDetail(type: 'removed');
    }
  }

  Future<List<SteamGame>> mapGameDetail(List<SteamGame> games) async {
    print('games length: ${games.length}');
    int i = 0;
    List<String> list = [];
    try {
      for (SteamGame game in games) {
        print("get ${game.appID} - ${game.name}");
        var gameDetail = await getSteamGameDetail(game.appID!);
        i++;
        if (gameDetail.type == "game") {
          game.steamGameDetail = await getSteamGameDetail(game.appID!);
        } else {
          print("remove ${game.name}");
          list.add(game.appID!);
        }
      }

      for (var e in list) {
        games.removeWhere((element) {
          if (element.appID == e) {
            print('${element.appID} remove at $e');
          }

          return element.appID == e;
        });
      }
    } catch (e) {
      print("error: $e");
      print("error at: $i");
    }
    return games;
  }
}
