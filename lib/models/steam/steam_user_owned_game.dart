// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SteamOwnedGame {
  int? appid;
  int? playtimeForever;
  int? playtimeWindowsForever;
  int? playtimeMacForever;
  int? playtimeLinuxForever;
  int? rtimeLastPlayed;
  SteamOwnedGame({
    this.appid,
    this.playtimeForever,
    this.playtimeWindowsForever,
    this.playtimeMacForever,
    this.playtimeLinuxForever,
    this.rtimeLastPlayed,
  });

  SteamOwnedGame copyWith({
    int? appid,
    int? playtimeForever,
    int? playtimeWindowsForever,
    int? playtimeMacForever,
    int? playtimeLinuxForever,
    int? rtimeLastPlayed,
  }) {
    return SteamOwnedGame(
      appid: appid ?? this.appid,
      playtimeForever: playtimeForever ?? this.playtimeForever,
      playtimeWindowsForever:
          playtimeWindowsForever ?? this.playtimeWindowsForever,
      playtimeMacForever: playtimeMacForever ?? this.playtimeMacForever,
      playtimeLinuxForever: playtimeLinuxForever ?? this.playtimeLinuxForever,
      rtimeLastPlayed: rtimeLastPlayed ?? this.rtimeLastPlayed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appid': appid,
      'playtimeForever': playtimeForever,
      'playtimeWindowsForever': playtimeWindowsForever,
      'playtimeMacForever': playtimeMacForever,
      'playtimeLinuxForever': playtimeLinuxForever,
      'rtimeLastPlayed': rtimeLastPlayed,
    };
  }

  factory SteamOwnedGame.fromMap(Map<String, dynamic> map) {
    return SteamOwnedGame(
      appid: map['appid'] != null ? map['appid'] as int : null,
      playtimeForever: map['playtime_forever'],
      playtimeWindowsForever: map['playtime_windows_forever'],
      playtimeMacForever: map['playtime_mac_forever'],
      playtimeLinuxForever: map['playtime_linux_forever'],
      rtimeLastPlayed: map['rtime_last_played'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamOwnedGame.fromJson(String source) =>
      SteamOwnedGame.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SteamOwnedGame(appid: $appid, playtimeForever: $playtimeForever, playtimeWindowsForever: $playtimeWindowsForever, playtimeMacForever: $playtimeMacForever, playtimeLinuxForever: $playtimeLinuxForever, rtimeLastPlayed: $rtimeLastPlayed)';
  }

  @override
  bool operator ==(covariant SteamOwnedGame other) {
    if (identical(this, other)) return true;

    return other.appid == appid &&
        other.playtimeForever == playtimeForever &&
        other.playtimeWindowsForever == playtimeWindowsForever &&
        other.playtimeMacForever == playtimeMacForever &&
        other.playtimeLinuxForever == playtimeLinuxForever &&
        other.rtimeLastPlayed == rtimeLastPlayed;
  }

  @override
  int get hashCode {
    return appid.hashCode ^
        playtimeForever.hashCode ^
        playtimeWindowsForever.hashCode ^
        playtimeMacForever.hashCode ^
        playtimeLinuxForever.hashCode ^
        rtimeLastPlayed.hashCode;
  }
}
