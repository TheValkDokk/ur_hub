// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:xml/xml.dart';

import 'package:ur_hub/models/steam/steam_lite_game_info.dart';

class SteamUser {
  num? steamID64;
  String? steamID;
  String? onlineState;
  String? stateMessage;
  String? privacyState;
  num? visibilityState;
  String? avatarIcon;
  String? avatarMedium;
  String? avatarFull;
  num? vacBanned;
  String? tradeBanState;
  num? isLimitedAccount;
  String? customURL;
  String? memberSince;
  String? gameName;
  String? gameLink;
  String? gameIcon;
  String? gameLogo;
  String? gameLogoSmall;
  String? location;
  String? realname;
  String? summary;
  List<SteamLiteGameInfo>? mostPlayedGame;
  SteamUser({
    this.steamID64,
    this.steamID,
    this.onlineState,
    this.stateMessage,
    this.privacyState,
    this.visibilityState,
    this.avatarIcon,
    this.avatarMedium,
    this.avatarFull,
    this.vacBanned,
    this.tradeBanState,
    this.isLimitedAccount,
    this.customURL,
    this.memberSince,
    this.gameName,
    this.gameLink,
    this.gameIcon,
    this.gameLogo,
    this.gameLogoSmall,
    this.location,
    this.realname,
    this.summary,
    this.mostPlayedGame,
  });

  SteamUser copyWith({
    num? steamID64,
    String? steamID,
    String? onlineState,
    String? stateMessage,
    String? privacyState,
    num? visibilityState,
    String? avatarIcon,
    String? avatarMedium,
    String? avatarFull,
    num? vacBanned,
    String? tradeBanState,
    num? isLimitedAccount,
    String? customURL,
    String? memberSince,
    String? gameName,
    String? gameLink,
    String? gameIcon,
    String? gameLogo,
    String? gameLogoSmall,
    String? location,
    String? realname,
    String? summary,
    List<SteamLiteGameInfo>? mostPlayedGame,
  }) {
    return SteamUser(
      steamID64: steamID64 ?? this.steamID64,
      steamID: steamID ?? this.steamID,
      onlineState: onlineState ?? this.onlineState,
      stateMessage: stateMessage ?? this.stateMessage,
      privacyState: privacyState ?? this.privacyState,
      visibilityState: visibilityState ?? this.visibilityState,
      avatarIcon: avatarIcon ?? this.avatarIcon,
      avatarMedium: avatarMedium ?? this.avatarMedium,
      avatarFull: avatarFull ?? this.avatarFull,
      vacBanned: vacBanned ?? this.vacBanned,
      tradeBanState: tradeBanState ?? this.tradeBanState,
      isLimitedAccount: isLimitedAccount ?? this.isLimitedAccount,
      customURL: customURL ?? this.customURL,
      memberSince: memberSince ?? this.memberSince,
      gameName: gameName ?? this.gameName,
      gameLink: gameLink ?? this.gameLink,
      gameIcon: gameIcon ?? this.gameIcon,
      gameLogo: gameLogo ?? this.gameLogo,
      gameLogoSmall: gameLogoSmall ?? this.gameLogoSmall,
      location: location ?? this.location,
      realname: realname ?? this.realname,
      summary: summary ?? this.summary,
      mostPlayedGame: mostPlayedGame ?? this.mostPlayedGame,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'steamID64': steamID64,
      'steamID': steamID,
      'onlineState': onlineState,
      'stateMessage': stateMessage,
      'privacyState': privacyState,
      'visibilityState': visibilityState,
      'avatarIcon': avatarIcon,
      'avatarMedium': avatarMedium,
      'avatarFull': avatarFull,
      'vacBanned': vacBanned,
      'tradeBanState': tradeBanState,
      'isLimitedAccount': isLimitedAccount,
      'customURL': customURL,
      'memberSince': memberSince,
      'gameName': gameName,
      'gameLink': gameLink,
      'gameIcon': gameIcon,
      'gameLogo': gameLogo,
      'gameLogoSmall': gameLogoSmall,
      'location': location,
      'realname': realname,
      'summary': summary,
      'mostPlayedGame': mostPlayedGame == null
          ? []
          : mostPlayedGame!.map((x) => x.toMap()).toList(),
    };
  }

  factory SteamUser.fromMap(Map<String, dynamic> map) {
    return SteamUser(
      steamID64: map['steamID64'] != null ? map['steamID64'] as num : null,
      steamID: map['steamID'] != null ? map['steamID'] as String : null,
      onlineState:
          map['onlineState'] != null ? map['onlineState'] as String : null,
      stateMessage:
          map['stateMessage'] != null ? map['stateMessage'] as String : null,
      privacyState:
          map['privacyState'] != null ? map['privacyState'] as String : null,
      visibilityState:
          map['visibilityState'] != null ? map['visibilityState'] as num : null,
      avatarIcon:
          map['avatarIcon'] != null ? map['avatarIcon'] as String : null,
      avatarMedium:
          map['avatarMedium'] != null ? map['avatarMedium'] as String : null,
      avatarFull:
          map['avatarFull'] != null ? map['avatarFull'] as String : null,
      vacBanned: map['vacBanned'] != null ? map['vacBanned'] as num : null,
      tradeBanState:
          map['tradeBanState'] != null ? map['tradeBanState'] as String : null,
      isLimitedAccount: map['isLimitedAccount'] != null
          ? map['isLimitedAccount'] as num
          : null,
      customURL: map['customURL'] != null ? map['customURL'] as String : null,
      memberSince:
          map['memberSince'] != null ? map['memberSince'] as String : null,
      gameName: map['gameName'] != null ? map['gameName'] as String : null,
      gameLink: map['gameLink'] != null ? map['gameLink'] as String : null,
      gameIcon: map['gameIcon'] != null ? map['gameIcon'] as String : null,
      gameLogo: map['gameLogo'] != null ? map['gameLogo'] as String : null,
      gameLogoSmall:
          map['gameLogoSmall'] != null ? map['gameLogoSmall'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      realname: map['realname'] != null ? map['realname'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      mostPlayedGame: map['mostPlayedGame'] != null
          ? List<SteamLiteGameInfo>.from(
              (map['mostPlayedGame'] as List<dynamic>).map<SteamLiteGameInfo?>(
                (x) => SteamLiteGameInfo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamUser.fromJson(String source) =>
      SteamUser.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SteamUser.fromXmlElement(XmlElement xmlElement) {
    String getStringElement(String e, XmlElement xml) {
      var f = xml.getElement(e);
      if (xml.getElement(e) == null) {
        return "";
      } else {
        return f!.innerText;
      }
    }

    String getStringNestElement(List<String> e, XmlElement xml) {
      String re = "";
      for (var i = 0; i < e.length; i++) {
        var f = xml.getElement(e[i]);
        if (xml.getElement(e[i]) == null) {
          return "";
        } else {
          if (i == e.length) {
            re = f!.innerText;
          }
        }
      }
      return re;
    }

    return SteamUser(
      steamID64: num.tryParse(getStringElement("steamID64", xmlElement)) ?? 0,
      steamID: getStringElement("steamID", xmlElement),
      onlineState: getStringElement("onlineState", xmlElement),
      stateMessage: getStringElement("stateMessage", xmlElement),
      privacyState: getStringElement("privacyState", xmlElement),
      visibilityState:
          num.tryParse(getStringElement("visibilityState", xmlElement)) ?? 0,
      avatarIcon: getStringElement("avatarIcon", xmlElement),
      avatarMedium: getStringElement("avatarMedium", xmlElement),
      avatarFull: getStringElement("avatarFull", xmlElement),
      vacBanned: num.tryParse(getStringElement("vacBanned", xmlElement)) ?? 0,
      tradeBanState: getStringElement("tradeBanState", xmlElement),
      isLimitedAccount:
          num.tryParse(getStringElement("isLimitedAccount", xmlElement)) ?? 0,
      customURL: getStringElement("customURL", xmlElement),
      gameName: getStringNestElement(["inGameInfo", "gameName"], xmlElement),
      gameLink: getStringNestElement(["inGameInfo", "gameLink"], xmlElement),
      gameIcon: getStringNestElement(["inGameInfo", "gameIcon"], xmlElement),
      gameLogo: getStringNestElement(["inGameInfo", "gameLogo"], xmlElement),
      gameLogoSmall:
          getStringNestElement(["inGameInfo", "gameLogoSmall"], xmlElement),
      memberSince: getStringElement("memberSince", xmlElement),
      location: getStringElement("location", xmlElement),
      realname: getStringElement("realname", xmlElement),
      summary: getStringElement("summary", xmlElement),
    );
  }

  @override
  String toString() {
    return 'SteamUser(steamID64: $steamID64, steamID: $steamID, onlineState: $onlineState, stateMessage: $stateMessage, privacyState: $privacyState, visibilityState: $visibilityState, avatarIcon: $avatarIcon, avatarMedium: $avatarMedium, avatarFull: $avatarFull, vacBanned: $vacBanned, tradeBanState: $tradeBanState, isLimitedAccount: $isLimitedAccount, customURL: $customURL, memberSince: $memberSince, gameName: $gameName, gameLink: $gameLink, gameIcon: $gameIcon, gameLogo: $gameLogo, gameLogoSmall: $gameLogoSmall, location: $location, realname: $realname, summary: $summary, mostPlayedGame: $mostPlayedGame)';
  }
}
