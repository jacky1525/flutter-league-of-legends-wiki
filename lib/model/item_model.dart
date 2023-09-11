// To parse this JSON data, do
//
//     final itemModel = itemModelFromMap(jsonString);

import 'dart:convert';

ItemModel itemModelFromMap(String str) => ItemModel.fromMap(json.decode(str));

String itemModelToMap(ItemModel data) => json.encode(data.toMap());

class ItemModel {
  ItemModel({
    required this.name,
    required this.description,
    required this.colloq,
    required this.plaintext,
    required this.into,
    required this.from,
    required this.image,
    required this.gold,
    required this.tags,
    required this.maps,
    required this.stats,
  });

  final String name;
  final String description;
  final String colloq;
  final String plaintext;
  final List<dynamic> into;
  final List<dynamic> from;
  final Image image;
  final Gold gold;
  final List<String> tags;
  final Map<String, bool> maps;
  final Stats stats;

  factory ItemModel.fromMap(Map<String, dynamic> json) {
    List<String> tags =
        List.from(List<String>.from(json["tags"].map((e) => e)));
    List<dynamic> into = json["into"] != null
        ? List.from(List<dynamic>.from(json["into"].map((e) => e)))
        : [];
    List<dynamic> from = json["from"] != null
        ? List.from(List<dynamic>.from(json["from"].map((e) => e)))
        : [];
    return ItemModel(
      name: json["name"],
      description: json["description"],
      colloq: json["colloq"],
      plaintext: json["plaintext"],
      into: into,
      from: from,
      image: Image.fromMap(json["image"]),
      gold: Gold.fromMap(json["gold"]),
      tags: tags,
      maps: Map.from(json["maps"]).map((k, v) => MapEntry<String, bool>(k, v)),
      stats: Stats.fromMap(json["stats"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "colloq": colloq,
        "plaintext": plaintext,
        "into": List<dynamic>.from(into.map((x) => x)),
        "from": List<dynamic>.from(from.map((x) => x)),
        "image": image.toMap(),
        "gold": gold.toMap(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "maps": Map.from(maps).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "stats": stats.toMap(),
      };
}

class Gold {
  Gold({
    required this.base,
    required this.purchasable,
    required this.total,
    required this.sell,
  });

  final int base;
  final bool purchasable;
  final int total;
  final int sell;

  factory Gold.fromMap(Map<String, dynamic> json) => Gold(
        base: json["base"],
        purchasable: json["purchasable"],
        total: json["total"],
        sell: json["sell"],
      );

  Map<String, dynamic> toMap() => {
        "base": base,
        "purchasable": purchasable,
        "total": total,
        "sell": sell,
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

class Stats {
  Stats({
    required this.flatMovementSpeedMod,
  });

  final int? flatMovementSpeedMod;

  factory Stats.fromMap(Map<String, dynamic> json) => Stats(
        flatMovementSpeedMod: json["FlatMovementSpeedMod"],
      );

  Map<String, dynamic> toMap() => {
        "FlatMovementSpeedMod": flatMovementSpeedMod,
      };
}
