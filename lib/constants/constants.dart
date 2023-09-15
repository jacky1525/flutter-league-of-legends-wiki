import 'package:flutter/material.dart';
import 'package:flutter_json/model/tag_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Status {
  initial,
  loading,
  loaded,
  error,
}

List<String> hiddenItems = [
  "Super Mech Armor",
  "Super Mech Power Field",
  "Structure Bounty",
  "OvererchargedHA",
  "Fortification",
  "Vanguard",
  "Penetrating Bullets",
  "Reinforced Armor",
  "Warden's Eye",
  "Overcharged",
  "Anti-tower Socks",
  "Gusto",
  "Phreakish Gusto",
  "Turret Plating",
  "Tower Power-Up",
  "Gangplank Placeholder",
  "<rarityLegendary>Fire at Will</rarityLegendary><br><subtitleLeft><silver>500 Silver Serpents</silver></subtitleLeft>",
  "<rarityLegendary>Death's Daughter</rarityLegendary><br><subtitleLeft><silver>500 Silver Serpents</silver></subtitleLeft>",
  "<rarityLegendary>Raise Morale</rarityLegendary><br><subtitleLeft><silver>500 Silver Serpents</silver></subtitleLeft>"
];

List<TagModel> tagList = [
  TagModel(tag: "Armor", isCheck: false),
  TagModel(tag: "SpellBlock", isCheck: false),
  TagModel(tag: "LifeSteal", isCheck: false),
  TagModel(tag: "CriticalStrike", isCheck: false),
  TagModel(tag: "AttackSpeed", isCheck: false),
  TagModel(tag: "Damage", isCheck: false),
  TagModel(tag: "Mana", isCheck: false),
  TagModel(tag: "SpellDamage", isCheck: false),
  TagModel(tag: "CooldownReduction", isCheck: false),
  TagModel(tag: "ManaRegen", isCheck: false),
  TagModel(tag: "Boots", isCheck: false),
  TagModel(tag: "NonbootsMovement", isCheck: false),
  TagModel(tag: "HealthRegen", isCheck: false),
  TagModel(tag: "Health", isCheck: false),
  TagModel(tag: "Stealth", isCheck: false),
  TagModel(tag: "Active", isCheck: false),
  TagModel(tag: "MagicPenetration", isCheck: false),
  TagModel(tag: "ArmorPenetration", isCheck: false),
  TagModel(tag: "Aura", isCheck: false),
  TagModel(tag: "OnHit", isCheck: false),
  TagModel(tag: "Trinket", isCheck: false),
  TagModel(tag: "Slow", isCheck: false),
  TagModel(tag: "SpellVamp", isCheck: false),
  TagModel(tag: "Tenacity", isCheck: false),
  TagModel(tag: "Lane", isCheck: false),
  TagModel(tag: "Jungle", isCheck: false),
  TagModel(tag: "GoldPer", isCheck: false),
  TagModel(tag: "Consumable", isCheck: false),
  TagModel(tag: "Vision", isCheck: false),
];

class Constants {
  static const String championTitle = 'Champions';
  static const String summonerTitle = 'Summoner Spells';
  static const String runeTitle = 'Runes';
  static const String itemTitle = 'Items';
  static const String tftTitle = "Teamfight Tactics";
  static const String RGAPI = "";

  static TextStyle championTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(40));
  }

  static TextStyle tftTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(32));
  }

  static TextStyle itemTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(40));
  }

  static TextStyle summonerTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(40));
  }

  static TextStyle runeTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(32));
  }

  static TextStyle championNameStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20));
  }

  static TextStyle championSearchNameStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(32));
  }

  static TextStyle championInfoNameStyle(color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle championTagStyle() {
    return TextStyle(color: Colors.lime, fontSize: _calculateFontSize(12));
  }

  static TextStyle championSearchTagStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20));
  }

  static double calculateIconSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.08.sw;
    } else {
      return 0.1.sh;
    }
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.6).sp;
    }
  }

  static String imagePath = 'assets/images/icon.png';
}
