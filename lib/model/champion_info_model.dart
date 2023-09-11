// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

ChampionInfoModel championInfoModelFromMap(String str) =>
    ChampionInfoModel.fromMap(json.decode(str));

String championInfoModelToMap(ChampionInfoModel data) =>
    json.encode(data.toMap());

class ChampionInfoModel {
  ChampionInfoModel({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.image,
    required this.skins,
    required this.lore,
    required this.blurb,
    required this.allytips,
    required this.enemytips,
    required this.tags,
    required this.partype,
    required this.info,
    required this.stats,
    required this.spells,
    required this.passive,
    required this.recommended,
  });

  final String id;
  final String key;
  final String name;
  final String title;
  final Image image;
  final List<Skin> skins;
  final String lore;
  final String blurb;
  final List<String> allytips;
  final List<String> enemytips;
  final List<String> tags;
  final String partype;
  final Info info;
  final Map<String, double> stats;
  final List<Spell> spells;
  final Passive passive;
  final List<dynamic> recommended;

  factory ChampionInfoModel.fromMap(Map<String, dynamic> json) =>
      ChampionInfoModel(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        image: Image.fromMap(json["image"]),
        skins: List<Skin>.from(json["skins"].map((x) => Skin.fromMap(x))),
        lore: json["lore"],
        blurb: json["blurb"],
        allytips: List<String>.from(json["allytips"].map((x) => x)),
        enemytips: List<String>.from(json["enemytips"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        info: Info.fromMap(json["info"]),
        stats: Map.from(json["stats"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        spells: List<Spell>.from(json["spells"].map((x) => Spell.fromMap(x))),
        passive: Passive.fromMap(json["passive"]),
        recommended: List<dynamic>.from(json["recommended"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "image": image.toMap(),
        "skins": List<dynamic>.from(skins.map((x) => x.toMap())),
        "lore": lore,
        "blurb": blurb,
        "allytips": List<dynamic>.from(allytips.map((x) => x)),
        "enemytips": List<dynamic>.from(enemytips.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "partype": partype,
        "info": info.toMap(),
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "spells": List<dynamic>.from(spells.map((x) => x.toMap())),
        "passive": passive.toMap(),
        "recommended": List<dynamic>.from(recommended.map((x) => x)),
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

class Passive {
  Passive({
    required this.name,
    required this.description,
    required this.image,
  });

  final String name;
  final String description;
  final Image image;

  factory Passive.fromMap(Map<String, dynamic> json) => Passive(
        name: json["name"],
        description: json["description"],
        image: Image.fromMap(json["image"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "image": image.toMap(),
      };
}

class Skin {
  Skin({
    required this.id,
    required this.num,
    required this.name,
    required this.chromas,
  });

  final String id;
  final int num;
  final String name;
  final bool chromas;

  factory Skin.fromMap(Map<String, dynamic> json) => Skin(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        chromas: json["chromas"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "num": num,
        "name": name,
        "chromas": chromas,
      };
}

class Spell {
  Spell({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.leveltip,
    required this.maxrank,
    required this.cooldown,
    required this.cooldownBurn,
    required this.cost,
    required this.costBurn,
    required this.datavalues,
    required this.effect,
    required this.effectBurn,
    required this.vars,
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
  final Leveltip? leveltip;
  final int maxrank;
  final List<double> cooldown;
  final String cooldownBurn;
  final List<int> cost;
  final String costBurn;
  final Datavalues datavalues;
  final List<List<dynamic>>? effect;
  final List<String>? effectBurn;
  final List<dynamic> vars;
  final String costType;
  final String maxammo;
  final List<int> range;
  final String rangeBurn;
  final Image image;
  final String resource;

  factory Spell.fromMap(Map<String, dynamic> json) => Spell(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        leveltip: json["leveltip"] != null
            ? Leveltip.fromMap(json["leveltip"])
            : null,
        maxrank: json["maxrank"],
        cooldown: List<double>.from(json["cooldown"].map((x) => x.toDouble())),
        cooldownBurn: json["cooldownBurn"],
        cost: List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        datavalues: Datavalues.fromMap(json["datavalues"]),
        effect: json["effect"] != null
            ? (json["effect"] as List<dynamic>?)
                ?.map<List<dynamic>>(
                    (x) => x != null ? (x as List<dynamic>?) ?? [] : [])
                .toList()
            : null,
        effectBurn: json["effectBurn"] != null
            ? List<String>.from(
                json["effectBurn"].map((x) => x != null ? x.toString() : ''))
            : null,
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
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
        "leveltip": leveltip?.toMap(),
        "maxrank": maxrank,
        "cooldown": List<dynamic>.from(cooldown.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": List<dynamic>.from(cost.map((x) => x)),
        "costBurn": costBurn,
        "datavalues": datavalues.toMap(),
        "effect": List<dynamic>.from(effect!.map(
            (x) => x == null ? null : List<dynamic>.from(x.map((x) => x)))),
        "effectBurn":
            List<dynamic>.from(effectBurn!.map((x) => x == null ? null : x)),
        "vars": List<dynamic>.from(vars.map((x) => x)),
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

class Leveltip {
  Leveltip({
    required this.label,
    required this.effect,
  });

  final List<String> label;
  final List<String> effect;

  factory Leveltip.fromMap(Map<String, dynamic> json) => Leveltip(
        label: List<String>.from(json["label"].map((x) => x)),
        effect: List<String>.from(json["effect"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "label": List<dynamic>.from(label.map((x) => x)),
        "effect": List<dynamic>.from(effect.map((x) => x)),
      };
}
