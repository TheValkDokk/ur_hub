// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SteamCategory {
  num? id;
  String? description;
  SteamCategory({
    this.id,
    this.description,
  });

  SteamCategory copyWith({
    num? id,
    String? description,
  }) {
    return SteamCategory(
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

  factory SteamCategory.fromMap(Map<String, dynamic> map) {
    return SteamCategory(
      id: map['id'] != null ? map['id'] as num : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SteamCategory.fromJson(String source) =>
      SteamCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SteamCategory(id: $id, description: $description)';

  @override
  bool operator ==(covariant SteamCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
