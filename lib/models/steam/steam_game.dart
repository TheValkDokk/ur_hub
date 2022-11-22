// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:xml/xml.dart';

import 'package:ur_hub/models/steam/steam_game_detail.dart';

class SteamGame {
  String? appID;
  String? name;
  String? logo;
  String? storeLink;
  String? statsLink;
  SteamGameDetail? steamGameDetail;
  String? globalStatsLink;
  String? userPlaytime;
  SteamGame({
    this.steamGameDetail,
    this.appID,
    this.name,
    this.logo,
    this.storeLink,
    this.statsLink,
    this.globalStatsLink,
    this.userPlaytime,
  });

  factory SteamGame.fromXmlElement(XmlElement xmlElement) {
    return SteamGame(
      appID: xmlElement.getElement("appID")!.innerText,
      name: xmlElement.getElement("name")!.innerText,
      logo: xmlElement.getElement("logo")!.innerText,
      storeLink: xmlElement.getElement("storeLink")!.innerText,
      // statsLink: xmlElement.getElement("statsLink")!.innerText,
      // globalStatsLink: xmlElement.getElement("globalStatsLink")!.innerText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appID': appID,
      'name': name,
      'logo': logo,
      'storeLink': storeLink,
      'statsLink': statsLink,
      'globalStatsLink': globalStatsLink,
    };
  }

  factory SteamGame.fromMap(Map<String, dynamic> map) {
    return SteamGame(
      appID: map['appID'] != null ? map['appID'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      storeLink: map['storeLink'] != null ? map['storeLink'] as String : null,
      statsLink: map['statsLink'] != null ? map['statsLink'] as String : null,
      globalStatsLink: map['globalStatsLink'] != null
          ? map['globalStatsLink'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamGame.fromJson(String source) =>
      SteamGame.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SteamGame(appID: $appID, name: $name, logo: $logo, storeLink: $storeLink, statsLink: $statsLink, globalStatsLink: $globalStatsLink, detail: $steamGameDetail)';
  }
}
