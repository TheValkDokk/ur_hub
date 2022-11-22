// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SteamGenre {
  num? id;
  String? description;
  SteamGenre({
    this.id,
    this.description,
  });

  SteamGenre copyWith({
    num? id,
    String? description,
  }) {
    return SteamGenre(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory SteamGenre.fromMap(Map<String, dynamic> map) {
    return SteamGenre(
      id: map['id'] != null ? num.parse(map['id']) : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamGenre.fromJson(String source) =>
      SteamGenre.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SteamGenre(id: $id, description: $description)';

  @override
  bool operator ==(covariant SteamGenre other) {
    if (identical(this, other)) return true;

    return other.id == id && other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
