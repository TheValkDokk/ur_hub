// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SteamMovie {
  num? id;
  String? name;
  String? thumbnail;
  String? webm480;
  String? webmMax;
  String? mp4480;
  String? mp4Max;
  bool? highlight;
  SteamMovie({
    this.id,
    this.name,
    this.thumbnail,
    this.webm480,
    this.webmMax,
    this.mp4480,
    this.mp4Max,
    this.highlight,
  });

  SteamMovie copyWith({
    num? id,
    String? name,
    String? thumbnail,
    String? webm480,
    String? webmMax,
    String? mp4480,
    String? mp4Max,
    bool? highlight,
  }) {
    return SteamMovie(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      webm480: webm480 ?? this.webm480,
      webmMax: webmMax ?? this.webmMax,
      mp4480: mp4480 ?? this.mp4480,
      mp4Max: mp4Max ?? this.mp4Max,
      highlight: highlight ?? this.highlight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
      'webm480': webm480,
      'webmMax': webmMax,
      'mp4480': mp4480,
      'mp4Max': mp4Max,
      'highlight': highlight,
    };
  }

  factory SteamMovie.fromMap(Map<String, dynamic> map) {
    return SteamMovie(
      id: map['id'] != null ? map['id'] as num : null,
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      webm480: map['webm'][480] != null ? map['webm'][480] as String : null,
      webmMax: map['webm']["max"] != null ? map['webm']["max"] as String : null,
      mp4480: map['mp4']["max"] != null ? map['mp4']["max"] as String : null,
      mp4Max: map['mp4']["max"] != null ? map['mp4']["max"] as String : null,
      highlight: map['highlight'] != null ? map['highlight'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamMovie.fromJson(String source) =>
      SteamMovie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SteamMovie(id: $id, name: $name, thumbnail: $thumbnail, webm480: $webm480, webmMax: $webmMax, mp4480: $mp4480, mp4Max: $mp4Max, highlight: $highlight)';
  }

  @override
  bool operator ==(covariant SteamMovie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.thumbnail == thumbnail &&
        other.webm480 == webm480 &&
        other.webmMax == webmMax &&
        other.mp4480 == mp4480 &&
        other.mp4Max == mp4Max &&
        other.highlight == highlight;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        thumbnail.hashCode ^
        webm480.hashCode ^
        webmMax.hashCode ^
        mp4480.hashCode ^
        mp4Max.hashCode ^
        highlight.hashCode;
  }
}
