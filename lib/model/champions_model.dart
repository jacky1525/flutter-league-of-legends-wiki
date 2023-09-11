// To parse this JSON data, do
//
//     final championsModel = championsModelFromMap(jsonString);

import 'dart:convert';

ChampionsModel championsModelFromMap(String str) =>
    ChampionsModel.fromMap(json.decode(str));

String championsModelToMap(ChampionsModel data) => json.encode(data.toMap());

class ChampionsModel {
  ChampionsModel({
    required this.version,
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.info,
    required this.image,
    required this.tags,
    required this.partype,
    required this.stats,
  });

  final String version;
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Info info;
  final Image image;
  final List<String> tags;
  final String partype;
  final Map<String, double> stats;

  factory ChampionsModel.fromMap(Map<String, dynamic> json) => ChampionsModel(
        version: json["version"],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        blurb: json["blurb"],
        info: Info.fromMap(json["info"]),
        image: Image.fromMap(json["image"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        stats: Map.from(json["stats"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "blurb": blurb,
        "info": info.toMap(),
        "image": image.toMap(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "partype": partype,
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Image {
  Image({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        full: json["full"],
        sprite: json["sprite"],
        group: json["group"],
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
      );

  Map<String, dynamic> toMap() => {
        "full": full,
        "sprite": sprite,
        "group": group,
        "x": x,
        "y": y,
        "w": w,
        "h": h,
      };
}

class Info {
  Info({
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
  });

  final int attack;
  final int defense;
  final int magic;
  final int difficulty;

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toMap() => {
        "attack": attack,
        "defense": defense,
        "magic": magic,
        "difficulty": difficulty,
      };
}
