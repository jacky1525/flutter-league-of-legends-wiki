// To parse this JSON data, do
//
//     final runeModel = runeModelFromMap(jsonString);


import 'dart:convert';

RuneModel runeModelFromMap(String str) => RuneModel.fromMap(json.decode(str));

String runeModelToMap(RuneModel data) => json.encode(data.toMap());

class RuneModel {
    RuneModel({
        required this.id,
        required this.key,
        required this.icon,
        required this.name,
        required this.slots,
    });

    final int id;
    final String key;
    final String icon;
    final String name;
    final List<Slot> slots;

    factory RuneModel.fromMap(Map<String, dynamic> json) => RuneModel(
        id: json["id"],
        key: json["key"],
        icon: json["icon"],
        name: json["name"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "key": key,
        "icon": icon,
        "name": name,
        "slots": List<dynamic>.from(slots.map((x) => x.toMap())),
    };
}

class Slot {
    Slot({
        required this.runes,
    });

    final List<Rune> runes;

    factory Slot.fromMap(Map<String, dynamic> json) => Slot(
        runes: List<Rune>.from(json["runes"].map((x) => Rune.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "runes": List<dynamic>.from(runes.map((x) => x.toMap())),
    };
}

class Rune {
    Rune({
        required this.id,
        required this.key,
        required this.icon,
        required this.name,
        required this.shortDesc,
        required this.longDesc,
    });

    final int id;
    final String key;
    final String icon;
    final String name;
    final String shortDesc;
    final String longDesc;

    factory Rune.fromMap(Map<String, dynamic> json) => Rune(
        id: json["id"],
        key: json["key"],
        icon: json["icon"],
        name: json["name"],
        shortDesc: json["shortDesc"],
        longDesc: json["longDesc"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "key": key,
        "icon": icon,
        "name": name,
        "shortDesc": shortDesc,
        "longDesc": longDesc,
    };
}
