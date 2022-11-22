// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ur_hub/models/steam/steam_genre.dart';
import 'package:ur_hub/models/steam/steam_movie.dart';
import 'package:ur_hub/models/steam/steam_screenshot.dart';

import 'steam_category.dart';

class SteamGameDetail {
  String? type;
  String? name;
  num? steam_appid;
  num? required_age;
  bool? is_free;
  String? controller_support;
  String? detailed_description;
  String? about_the_game;
  String? short_description;
  String? full_game_id;
  String? full_game_name;
  String? supported_languages;
  String? header_image;
  String? website;
  String? minimum;
  String? recommended;
  String? legal_notice;
  List<String>? developers;
  List<String>? publishers;
  bool? windows;
  bool? mac;
  bool? linux;
  List<SteamCategory>? categories;
  List<SteamGenre>? genres;
  List<SteamScreenShot>? screenshots;
  List<SteamMovie>? movies;
  num? recommendations;
  bool? coming_soon;
  String? date;
  String? supportUrl;
  String? supportMail;
  String? background;
  String? background_raw;
  SteamGameDetail({
    this.type,
    this.name,
    this.steam_appid,
    this.required_age,
    this.is_free,
    this.controller_support,
    this.detailed_description,
    this.about_the_game,
    this.short_description,
    this.full_game_id,
    this.full_game_name,
    this.supported_languages,
    this.header_image,
    this.website,
    this.minimum,
    this.recommended,
    this.legal_notice,
    this.developers,
    this.publishers,
    this.windows,
    this.mac,
    this.linux,
    this.categories,
    this.genres,
    this.screenshots,
    this.movies,
    this.recommendations,
    this.coming_soon,
    this.date,
    this.supportUrl,
    this.supportMail,
    this.background,
    this.background_raw,
  });

  SteamGameDetail copyWith({
    String? type,
    String? name,
    num? steam_appid,
    num? required_age,
    bool? is_free,
    String? controller_support,
    String? detailed_description,
    String? about_the_game,
    String? short_description,
    String? full_game_id,
    String? full_game_name,
    String? supported_languages,
    String? header_image,
    String? website,
    String? minimum,
    String? recommended,
    String? legal_notice,
    List<String>? developers,
    List<String>? publishers,
    bool? windows,
    bool? mac,
    bool? linux,
    List<SteamCategory>? categories,
    List<SteamGenre>? genres,
    List<SteamScreenShot>? screenshots,
    List<SteamMovie>? movies,
    num? recommendations,
    bool? coming_soon,
    String? date,
    String? supportUrl,
    String? supportMail,
    String? background,
    String? background_raw,
  }) {
    return SteamGameDetail(
      type: type ?? this.type,
      name: name ?? this.name,
      steam_appid: steam_appid ?? this.steam_appid,
      required_age: required_age ?? this.required_age,
      is_free: is_free ?? this.is_free,
      controller_support: controller_support ?? this.controller_support,
      detailed_description: detailed_description ?? this.detailed_description,
      about_the_game: about_the_game ?? this.about_the_game,
      short_description: short_description ?? this.short_description,
      full_game_id: full_game_id ?? this.full_game_id,
      full_game_name: full_game_name ?? this.full_game_name,
      supported_languages: supported_languages ?? this.supported_languages,
      header_image: header_image ?? this.header_image,
      website: website ?? this.website,
      minimum: minimum ?? this.minimum,
      recommended: recommended ?? this.recommended,
      legal_notice: legal_notice ?? this.legal_notice,
      developers: developers ?? this.developers,
      publishers: publishers ?? this.publishers,
      windows: windows ?? this.windows,
      mac: mac ?? this.mac,
      linux: linux ?? this.linux,
      categories: categories ?? this.categories,
      genres: genres ?? this.genres,
      screenshots: screenshots ?? this.screenshots,
      movies: movies ?? this.movies,
      recommendations: recommendations ?? this.recommendations,
      coming_soon: coming_soon ?? this.coming_soon,
      date: date ?? this.date,
      supportUrl: supportUrl ?? this.supportUrl,
      supportMail: supportMail ?? this.supportMail,
      background: background ?? this.background,
      background_raw: background_raw ?? this.background_raw,
    );
  }

  factory SteamGameDetail.fromMap(Map<String, dynamic> map) {
    String fGameId = "";
    String fGameName = "";
    String min = "";
    String rec = "";
    bool pWin = false;
    bool pMac = false;
    bool pLin = false;
    bool releaseSoon = false;
    String releaseDate = "";
    num recomTotal = 0;
    String supUrl = "";
    String supMail = "";
    try {
      fGameId = map['fullgame']["appid"];
    } catch (e) {}
    try {
      fGameName = map['fullgame']["name"];
    } catch (e) {}
    try {
      min = map["pc_requirements"]['minimum'];
    } catch (e) {}
    try {
      rec = map["pc_requirements"]['recommended'];
    } catch (e) {}
    try {
      pWin = map["platforms"]['windows'] as bool;
    } catch (e) {}
    try {
      pMac = map["platforms"]['mac'] as bool;
    } catch (e) {}
    try {
      pLin = map["platforms"]['linux'] as bool;
    } catch (e) {}
    try {
      recomTotal = map['recommendations']["total"] as num;
    } catch (e) {}
    try {
      releaseSoon = map["release_date"]['coming_soon'] as bool;
    } catch (e) {}
    try {
      releaseDate = map["release_date"]['date'];
    } catch (e) {}
    try {
      supUrl = map["support_info"]['url'];
    } catch (e) {}
    try {
      supMail = map["support_info"]['email'];
    } catch (e) {}

    return SteamGameDetail(
      type: map['type'] != null ? map['type'] as String : "",
      name: map['name'] != null ? map['name'] as String : "",
      steam_appid:
          map['steam_appid'] != null ? map['steam_appid'] as num : null,
      required_age: map['required_age'] != null
          ? num.parse(map['required_age'].toString())
          : null,
      is_free: map['is_free'] != null ? map['is_free'] as bool : false,
      controller_support: map['controller_support'] != null
          ? map['controller_support'] as String
          : "",
      detailed_description: map['detailed_description'] != null
          ? map['detailed_description'] as String
          : "",
      about_the_game:
          map['about_the_game'] != null ? map['about_the_game'] as String : "",
      short_description: map['short_description'] != null
          ? map['short_description'] as String
          : "",
      full_game_id: fGameId,
      full_game_name: fGameName,
      supported_languages: map['supported_languages'] != null
          ? map['supported_languages'] as String
          : "",
      header_image:
          map['header_image'] != null ? map['header_image'] as String : "",
      website: map['website'] != null ? map['website'] as String : "",
      minimum: min,
      recommended: rec,
      legal_notice:
          map['legal_notice'] != null ? map['legal_notice'] as String : "",
      developers: map['developers'] != null
          ? List<String>.from((map['developers'] as List<dynamic>))
          : [""],
      publishers: map['publishers'] != null
          ? List<String>.from((map['publishers'] as List<dynamic>))
          : [""],
      windows: pWin,
      mac: pMac,
      linux: pLin,
      categories: map['categories'] != null
          ? List<SteamCategory>.from(
              (map['categories'] as List<dynamic>).map<SteamCategory?>(
                (x) => SteamCategory.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      genres: map['genres'] != null
          ? List<SteamGenre>.from(
              (map['genres'] as List<dynamic>).map<SteamGenre?>(
                (x) => SteamGenre.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      screenshots: map['screenshots'] != null
          ? List<SteamScreenShot>.from(
              (map['screenshots'] as List<dynamic>).map<SteamScreenShot?>(
                (x) => SteamScreenShot.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      movies: map['movies'] != null
          ? List<SteamMovie>.from(
              (map['movies'] as List<dynamic>).map<SteamMovie?>(
                (x) => SteamMovie.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      recommendations: recomTotal,
      coming_soon: releaseSoon,
      date: releaseDate,
      supportUrl: supUrl,
      supportMail: supMail,
      background: map['background'] != null ? map['background'] as String : "",
      background_raw:
          map['background_raw'] != null ? map['background_raw'] as String : "",
    );
  }

  factory SteamGameDetail.fromJson(String source) =>
      SteamGameDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SteamGameDetail(type: $type, name: $name, steam_appid: $steam_appid, required_age: $required_age, is_free: $is_free, controller_support: $controller_support, detailed_description: $detailed_description, about_the_game: $about_the_game, short_description: $short_description, full_game_id: $full_game_id, full_game_name: $full_game_name, supported_languages: $supported_languages, header_image: $header_image, website: $website, minimum: $minimum, recommended: $recommended, legal_notice: $legal_notice, developers: $developers, publishers: $publishers, windows: $windows, mac: $mac, linux: $linux, categories: $categories, genres: $genres, screenshots: $screenshots, movies: $movies, recommendations: $recommendations, coming_soon: $coming_soon, date: $date, supportUrl: $supportUrl, supportMail: $supportMail, background: $background, background_raw: $background_raw)';
  }

  @override
  bool operator ==(covariant SteamGameDetail other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.name == name &&
        other.steam_appid == steam_appid &&
        other.required_age == required_age &&
        other.is_free == is_free &&
        other.controller_support == controller_support &&
        other.detailed_description == detailed_description &&
        other.about_the_game == about_the_game &&
        other.short_description == short_description &&
        other.full_game_id == full_game_id &&
        other.full_game_name == full_game_name &&
        other.supported_languages == supported_languages &&
        other.header_image == header_image &&
        other.website == website &&
        other.minimum == minimum &&
        other.recommended == recommended &&
        other.legal_notice == legal_notice &&
        listEquals(other.developers, developers) &&
        listEquals(other.publishers, publishers) &&
        other.windows == windows &&
        other.mac == mac &&
        other.linux == linux &&
        listEquals(other.categories, categories) &&
        listEquals(other.genres, genres) &&
        listEquals(other.screenshots, screenshots) &&
        listEquals(other.movies, movies) &&
        other.recommendations == recommendations &&
        other.coming_soon == coming_soon &&
        other.date == date &&
        other.supportUrl == supportUrl &&
        other.supportMail == supportMail &&
        other.background == background &&
        other.background_raw == background_raw;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        name.hashCode ^
        steam_appid.hashCode ^
        required_age.hashCode ^
        is_free.hashCode ^
        controller_support.hashCode ^
        detailed_description.hashCode ^
        about_the_game.hashCode ^
        short_description.hashCode ^
        full_game_id.hashCode ^
        full_game_name.hashCode ^
        supported_languages.hashCode ^
        header_image.hashCode ^
        website.hashCode ^
        minimum.hashCode ^
        recommended.hashCode ^
        legal_notice.hashCode ^
        developers.hashCode ^
        publishers.hashCode ^
        windows.hashCode ^
        mac.hashCode ^
        linux.hashCode ^
        categories.hashCode ^
        genres.hashCode ^
        screenshots.hashCode ^
        movies.hashCode ^
        recommendations.hashCode ^
        coming_soon.hashCode ^
        date.hashCode ^
        supportUrl.hashCode ^
        supportMail.hashCode ^
        background.hashCode ^
        background_raw.hashCode;
  }
}
