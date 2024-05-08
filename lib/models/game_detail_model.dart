// To parse this JSON data, do
//
//     final gameDetailModel = gameDetailModelFromJson(jsonString);

import 'dart:convert';

GameDetailModel gameDetailModelFromJson(String str) {
  final jsonData = json.decode(str);
  if (jsonData == null || jsonData is! Map<String, dynamic>) {
    throw Exception('Data is not in expected format');
  }
  return GameDetailModel.fromJson(jsonData);
}

String gameDetailModelToJson(GameDetailModel data) =>
    json.encode(data.toJson());

class GameDetailModel {
  int id;
  String title;
  String thumbnail;
  String status;
  String shortDescription;
  String description;
  String gameUrl;
  String genre;
  String platform;
  String publisher;
  String developer;
  String releaseDate;
  String freetogameProfileUrl;
  MinimumSystemRequirements minimumSystemRequirements;
  List<Screenshot> screenshots;

  GameDetailModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    required this.minimumSystemRequirements,
    required this.screenshots,
  });

  factory GameDetailModel.fromJson(Map<String, dynamic> json) =>
      GameDetailModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? 'Unknown title',
        thumbnail: json['thumbnail'] ?? '',
        status: json['status'] ?? '',
        shortDescription: json['short_description'] ?? '',
        description: json['description'] ?? '',
        gameUrl: json['game_url'] ?? '',
        genre: json['genre'] ?? '',
        platform: json['platform'] ?? '',
        publisher: json['publisher'] ?? '',
        developer: json['developer'] ?? '',
        releaseDate: json['release_date'] ?? '',
        freetogameProfileUrl: json['freetogame_profile_url'] ?? '',
        minimumSystemRequirements: MinimumSystemRequirements.fromJson(
          json['minimum_system_requirements'] ?? {},
        ),
        screenshots: (json['screenshots'] as List)
            .map((s) => Screenshot.fromJson(s as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "status": status,
        "short_description": shortDescription,
        "description": description,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date": releaseDate,
        "minimum_system_requirements": minimumSystemRequirements.toJson(),
        "screenshots": List<dynamic>.from(
          screenshots.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class MinimumSystemRequirements {
  String os;
  String processor;
  String memory;
  String graphics;
  String storage;

  MinimumSystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) =>
      MinimumSystemRequirements(
        os: json["os"] ?? '',
        processor: json["processor"] ?? '',
        memory: json["memory"] ?? '',
        graphics: json["graphics"] ?? '',
        storage: json["storage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "os": os,
        "processor": processor,
        "memory": memory,
        "graphics": graphics,
        "storage": storage,
      };
}

class Screenshot {
  int id;
  String image;

  Screenshot({required this.id, required this.image});

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    return Screenshot(
      id: json['id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
