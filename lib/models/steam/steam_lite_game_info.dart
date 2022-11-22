// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:xml/xml.dart';

class SteamLiteGameInfo {
  String? gameName;
  String? gameLink;
  String? gameIcon;
  String? gameLogo;
  String? gameLogoSmall;
  num? hoursPlayed;
  num? hoursOnRecord;
  String? statsName;
  SteamLiteGameInfo({
    this.gameName,
    this.gameLink,
    this.gameIcon,
    this.gameLogo,
    this.gameLogoSmall,
    this.hoursPlayed,
    this.hoursOnRecord,
    this.statsName,
  });

  SteamLiteGameInfo copyWith({
    String? gameName,
    String? gameLink,
    String? gameIcon,
    String? gameLogo,
    String? gameLogoSmall,
    num? hoursPlayed,
    num? hoursOnRecord,
    String? statsName,
  }) {
    return SteamLiteGameInfo(
      gameName: gameName ?? this.gameName,
      gameLink: gameLink ?? this.gameLink,
      gameIcon: gameIcon ?? this.gameIcon,
      gameLogo: gameLogo ?? this.gameLogo,
      gameLogoSmall: gameLogoSmall ?? this.gameLogoSmall,
      hoursPlayed: hoursPlayed ?? this.hoursPlayed,
      hoursOnRecord: hoursOnRecord ?? this.hoursOnRecord,
      statsName: statsName ?? this.statsName,
    );
  }

  factory SteamLiteGameInfo.fromXml(XmlElement xmlElement) {
    return SteamLiteGameInfo(
      gameName: xmlElement.getElement("gameName")!.innerText,
      gameLink: xmlElement.getElement("gameLink")!.innerText,
      gameIcon: xmlElement.getElement("gameIcon")!.innerText,
      gameLogo: xmlElement.getElement("gameLogo")!.innerText,
      gameLogoSmall: xmlElement.getElement("gameLogoSmall")!.innerText,
      hoursOnRecord:
          num.parse(xmlElement.getElement("hoursOnRecord")!.innerText),
      hoursPlayed: num.parse(xmlElement.getElement("hoursPlayed")!.innerText),
      statsName: xmlElement.getElement("statsName")!.innerText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gameName': gameName,
      'gameLink': gameLink,
      'gameIcon': gameIcon,
      'gameLogo': gameLogo,
      'gameLogoSmall': gameLogoSmall,
      'hoursPlayed': hoursPlayed,
      'hoursOnRecord': hoursOnRecord,
      'statsName': statsName,
    };
  }

  factory SteamLiteGameInfo.fromMap(Map<String, dynamic> map) {
    return SteamLiteGameInfo(
      gameName: map['gameName'] != null ? map['gameName'] as String : null,
      gameLink: map['gameLink'] != null ? map['gameLink'] as String : null,
      gameIcon: map['gameIcon'] != null ? map['gameIcon'] as String : null,
      gameLogo: map['gameLogo'] != null ? map['gameLogo'] as String : null,
      gameLogoSmall:
          map['gameLogoSmall'] != null ? map['gameLogoSmall'] as String : null,
      hoursPlayed:
          map['hoursPlayed'] != null ? map['hoursPlayed'] as num : null,
      hoursOnRecord:
          map['hoursOnRecord'] != null ? map['hoursOnRecord'] as num : null,
      statsName: map['statsName'] != null ? map['statsName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamLiteGameInfo.fromJson(String source) =>
      SteamLiteGameInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SteamLiteGameInfo(gameName: $gameName, gameLink: $gameLink, gameIcon: $gameIcon, gameLogo: $gameLogo, gameLogoSmall: $gameLogoSmall, hoursPlayed: $hoursPlayed, hoursOnRecord: $hoursOnRecord, statsName: $statsName)';
  }

  @override
  bool operator ==(covariant SteamLiteGameInfo other) {
    if (identical(this, other)) return true;

    return other.gameName == gameName &&
        other.gameLink == gameLink &&
        other.gameIcon == gameIcon &&
        other.gameLogo == gameLogo &&
        other.gameLogoSmall == gameLogoSmall &&
        other.hoursPlayed == hoursPlayed &&
        other.hoursOnRecord == hoursOnRecord &&
        other.statsName == statsName;
  }

  @override
  int get hashCode {
    return gameName.hashCode ^
        gameLink.hashCode ^
        gameIcon.hashCode ^
        gameLogo.hashCode ^
        gameLogoSmall.hashCode ^
        hoursPlayed.hashCode ^
        hoursOnRecord.hashCode ^
        statsName.hashCode;
  }
}
