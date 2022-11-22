// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class SteamScreenShot {
  num? id;
  String? path_thumbnail;
  String? path_full;
  SteamScreenShot({
    this.id,
    this.path_thumbnail,
    this.path_full,
  });

  SteamScreenShot copyWith({
    num? id,
    String? path_thumbnail,
    String? path_full,
  }) {
    return SteamScreenShot(
      id: id ?? this.id,
      path_thumbnail: path_thumbnail ?? this.path_thumbnail,
      path_full: path_full ?? this.path_full,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'path_thumbnail': path_thumbnail,
      'path_full': path_full,
    };
  }

  factory SteamScreenShot.fromMap(Map<String, dynamic> map) {
    return SteamScreenShot(
      id: map['id'] != null ? map['id'] as num : null,
      path_thumbnail: map['path_thumbnail'] != null
          ? map['path_thumbnail'] as String
          : null,
      path_full: map['path_full'] != null ? map['path_full'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamScreenShot.fromJson(String source) =>
      SteamScreenShot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SteamScreenShot(id: $id, path_thumbnail: $path_thumbnail, path_full: $path_full)';

  @override
  bool operator ==(covariant SteamScreenShot other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.path_thumbnail == path_thumbnail &&
        other.path_full == path_full;
  }

  @override
  int get hashCode =>
      id.hashCode ^ path_thumbnail.hashCode ^ path_full.hashCode;
}
