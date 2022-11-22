// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:ur_hub/models/steam/steam_user.dart';

class UserSettings {
  bool isFullScreen;
  bool isAutoStart;
  bool isSteamLogin;
  Color mainColor;
  Color secondColor;
  SteamUser? steamUser;
  UserSettings({
    required this.isFullScreen,
    required this.isAutoStart,
    required this.isSteamLogin,
    required this.mainColor,
    required this.secondColor,
    this.steamUser,
  });

  UserSettings copyWith({
    bool? isFullScreen,
    bool? isAutoStart,
    bool? isSteamLogin,
    Color? mainColor,
    Color? secondColor,
    SteamUser? steamUser,
  }) {
    return UserSettings(
      isFullScreen: isFullScreen ?? this.isFullScreen,
      isAutoStart: isAutoStart ?? this.isAutoStart,
      isSteamLogin: isSteamLogin ?? this.isSteamLogin,
      mainColor: mainColor ?? this.mainColor,
      secondColor: secondColor ?? this.secondColor,
      steamUser: steamUser ?? this.steamUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isFullScreen': isFullScreen,
      'isAutoStart': isAutoStart,
      'isSteamLogin': isSteamLogin,
      'mainColor': mainColor.value,
      'secondColor': secondColor.value,
      'steamUser': steamUser?.toMap(),
    };
  }

  factory UserSettings.fromMap(Map<String, dynamic> map) {
    return UserSettings(
      isFullScreen: map['isFullScreen'] as bool,
      isAutoStart: map['isAutoStart'] as bool,
      isSteamLogin: map['isSteamLogin'] as bool,
      mainColor: Color(map['mainColor'] as int),
      secondColor: Color(map['secondColor'] as int),
      steamUser: map['steamUser'] != null
          ? SteamUser.fromMap(map['steamUser'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSettings.fromJson(String source) =>
      UserSettings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserSettings(isFullScreen: $isFullScreen, isAutoStart: $isAutoStart, isSteamLogin: $isSteamLogin, mainColor: $mainColor, secondColor: $secondColor, steamUser: $steamUser)';
  }

  @override
  bool operator ==(covariant UserSettings other) {
    if (identical(this, other)) return true;

    return other.isFullScreen == isFullScreen &&
        other.isAutoStart == isAutoStart &&
        other.isSteamLogin == isSteamLogin &&
        other.mainColor == mainColor &&
        other.secondColor == secondColor &&
        other.steamUser == steamUser;
  }

  @override
  int get hashCode {
    return isFullScreen.hashCode ^
        isAutoStart.hashCode ^
        isSteamLogin.hashCode ^
        mainColor.hashCode ^
        secondColor.hashCode ^
        steamUser.hashCode;
  }
}
