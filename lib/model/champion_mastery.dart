// To parse this JSON data, do
//
//     final championMaster = championMasterFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ChampionMaster> championMasterFromMap(String str) =>
    List<ChampionMaster>.from(
        json.decode(str).map((x) => ChampionMaster.fromJson(x)));

String championMasterToMap(List<ChampionMaster> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ChampionMaster {
  final String puuid;
  final int championId;
  final int championLevel;
  final int championPoints;
  final int lastPlayTime;
  final int championPointsSinceLastLevel;
  final int championPointsUntilNextLevel;
  final bool chestGranted;
  final int tokensEarned;
  final String summonerId;

  ChampionMaster({
    required this.puuid,
    required this.championId,
    required this.championLevel,
    required this.championPoints,
    required this.lastPlayTime,
    required this.championPointsSinceLastLevel,
    required this.championPointsUntilNextLevel,
    required this.chestGranted,
    required this.tokensEarned,
    required this.summonerId,
  });

  factory ChampionMaster.fromJson(Map<String, dynamic> json) => ChampionMaster(
        puuid: json["puuid"],
        championId: json["championId"],
        championLevel: json["championLevel"],
        championPoints: json["championPoints"],
        lastPlayTime: json["lastPlayTime"],
        championPointsSinceLastLevel: json["championPointsSinceLastLevel"],
        championPointsUntilNextLevel: json["championPointsUntilNextLevel"],
        chestGranted: json["chestGranted"],
        tokensEarned: json["tokensEarned"],
        summonerId: json["summonerId"],
      );

  factory ChampionMaster.empty() {
    return ChampionMaster(
      puuid: "",
      championId: 0,
      championLevel: 0,
      championPoints: 0,
      lastPlayTime: 0,
      championPointsSinceLastLevel: 0,
      championPointsUntilNextLevel: 0,
      chestGranted: false,
      tokensEarned: 0,
      summonerId: "",
    );
  }

  Map<String, dynamic> toMap() => {
        "puuid": puuid,
        "championId": championId,
        "championLevel": championLevel,
        "championPoints": championPoints,
        "lastPlayTime": lastPlayTime,
        "championPointsSinceLastLevel": championPointsSinceLastLevel,
        "championPointsUntilNextLevel": championPointsUntilNextLevel,
        "chestGranted": chestGranted,
        "tokensEarned": tokensEarned,
        "summonerId": summonerId,
      };
}
