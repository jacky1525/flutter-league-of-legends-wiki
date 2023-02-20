// To parse this JSON data, do
//
//     final SummonerSpellModel = SummonerSpellModelFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

SummonerSpellModel SummonerSpellModelFromMap(String str) =>
    SummonerSpellModel.fromMap(json.decode(str));

String SummonerSpellModelToMap(SummonerSpellModel data) =>
    json.encode(data.toMap());

class SummonerSpellModel {
  SummonerSpellModel({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.maxrank,
    required this.cooldown,
    required this.cooldownBurn,
    required this.cost,
    required this.costBurn,
    required this.datavalues,
    required this.effect,
    required this.effectBurn,
    required this.vars,
    required this.key,
    required this.summonerLevel,
    required this.modes,
    required this.costType,
    required this.maxammo,
    required this.range,
    required this.rangeBurn,
    required this.image,
    required this.resource,
  });

  final String id;
  final String name;
  final String description;
  final String tooltip;
  final int maxrank;
  final List<int> cooldown;
  final String cooldownBurn;
  final List<int> cost;
  final String costBurn;
  final Datavalues datavalues;
  final List<List<dynamic>> effect;
  final List<String> effectBurn;
  final List<dynamic> vars;
  final String key;
  final int summonerLevel;
  final List<String> modes;
  final String costType;
  final String maxammo;
  final List<int> range;
  final String rangeBurn;
  final Image image;
  final String resource;

  factory SummonerSpellModel.fromMap(Map<String, dynamic> json) =>
      SummonerSpellModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        maxrank: json["maxrank"],
        cooldown: List<int>.from(json["cooldown"].map((x) => x)),
        cooldownBurn: json["cooldownBurn"],
        cost: List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        datavalues: Datavalues.fromMap(json["datavalues"]),
        effect: List<List<dynamic>>.from(json["effect"]
            .map((x) => x == null ? null : List<dynamic>.from(x.map((x) => x)))),
        effectBurn: List<String>.from(
            json["effectBurn"].map((x) => x == null ? null : x)),
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
        key: json["key"],
        summonerLevel: json["summonerLevel"],
        modes: List<String>.from(json["modes"].map((x) => x)),
        costType: json["costType"],
        maxammo: json["maxammo"],
        range: List<int>.from(json["range"].map((x) => x)),
        rangeBurn: json["rangeBurn"],
        image: Image.fromMap(json["image"]),
        resource: json["resource"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "tooltip": tooltip,
        "maxrank": maxrank,
        "cooldown": List<dynamic>.from(cooldown.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": List<dynamic>.from(cost.map((x) => x)),
        "costBurn": costBurn,
        "datavalues": datavalues.toMap(),
        "effect": List<dynamic>.from(effect.map(
            (x) => x == null ? null : List<dynamic>.from(x.map((x) => x)))),
        "effectBurn":
            List<dynamic>.from(effectBurn.map((x) => x == null ? null : x)),
        "vars": List<dynamic>.from(vars.map((x) => x)),
        "key": key,
        "summonerLevel": summonerLevel,
        "modes": List<dynamic>.from(modes.map((x) => x)),
        "costType": costType,
        "maxammo": maxammo,
        "range": List<dynamic>.from(range.map((x) => x)),
        "rangeBurn": rangeBurn,
        "image": image.toMap(),
        "resource": resource,
      };
}

class Datavalues {
  Datavalues();

  factory Datavalues.fromMap(Map<String, dynamic> json) => Datavalues();

  Map<String, dynamic> toMap() => {};
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
