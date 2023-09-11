// To parse this JSON data, do
//
//     final gameStatus = gameStatusFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GameStatus gameStatusFromMap(String str) =>
    GameStatus.fromMap(json.decode(str));

String gameStatusToMap(GameStatus data) => json.encode(data.toMap());

class GameStatus {
  final int gameId;
  final int mapId;
  final String gameMode;
  final String gameType;
  final int gameQueueConfigId;
  final List<Participant> participants;
  final Observers observers;
  final String platformId;
  final List<dynamic> bannedChampions;
  final int gameStartTime;
  final int gameLength;

  GameStatus({
    required this.gameId,
    required this.mapId,
    required this.gameMode,
    required this.gameType,
    required this.gameQueueConfigId,
    required this.participants,
    required this.observers,
    required this.platformId,
    required this.bannedChampions,
    required this.gameStartTime,
    required this.gameLength,
  });

  factory GameStatus.fromMap(Map<String, dynamic> json) => GameStatus(
        gameId: json["gameId"],
        mapId: json["mapId"],
        gameMode: json["gameMode"],
        gameType: json["gameType"],
        gameQueueConfigId: json["gameQueueConfigId"],
        participants: List<Participant>.from(
            json["participants"].map((x) => Participant.fromMap(x))),
        observers: Observers.fromMap(json["observers"]),
        platformId: json["platformId"],
        bannedChampions:
            List<dynamic>.from(json["bannedChampions"].map((x) => x)),
        gameStartTime: json["gameStartTime"],
        gameLength: json["gameLength"],
      );

  Map<String, dynamic> toMap() => {
        "gameId": gameId,
        "mapId": mapId,
        "gameMode": gameMode,
        "gameType": gameType,
        "gameQueueConfigId": gameQueueConfigId,
        "participants": List<dynamic>.from(participants.map((x) => x.toMap())),
        "observers": observers.toMap(),
        "platformId": platformId,
        "bannedChampions": List<dynamic>.from(bannedChampions.map((x) => x)),
        "gameStartTime": gameStartTime,
        "gameLength": gameLength,
      };

  factory GameStatus.empty() {
    return GameStatus(
      gameId: 0,
      mapId: 0,
      gameMode: "",
      gameType: "",
      gameQueueConfigId: 0,
      participants: [],
      observers: Observers.empty(),
      platformId: "",
      bannedChampions: [],
      gameStartTime: 0,
      gameLength: 0,
    );
  }
}

class Observers {
  final String encryptionKey;

  Observers({
    required this.encryptionKey,
  });

  factory Observers.fromMap(Map<String, dynamic> json) => Observers(
        encryptionKey: json["encryptionKey"],
      );

  Map<String, dynamic> toMap() => {
        "encryptionKey": encryptionKey,
      };

  factory Observers.empty() {
    return Observers(
      encryptionKey: "",
    );
  }
}

class Participant {
  final int teamId;
  final int spell1Id;
  final int spell2Id;
  final int championId;
  final int profileIconId;
  final String summonerName;
  final bool bot;
  final String summonerId;
  final List<dynamic> gameCustomizationObjects;
  final Perks perks;

  Participant({
    required this.teamId,
    required this.spell1Id,
    required this.spell2Id,
    required this.championId,
    required this.profileIconId,
    required this.summonerName,
    required this.bot,
    required this.summonerId,
    required this.gameCustomizationObjects,
    required this.perks,
  });

  factory Participant.fromMap(Map<String, dynamic> json) => Participant(
        teamId: json["teamId"],
        spell1Id: json["spell1Id"],
        spell2Id: json["spell2Id"],
        championId: json["championId"],
        profileIconId: json["profileIconId"],
        summonerName: json["summonerName"],
        bot: json["bot"],
        summonerId: json["summonerId"],
        gameCustomizationObjects:
            List<dynamic>.from(json["gameCustomizationObjects"].map((x) => x)),
        perks: Perks.fromMap(json["perks"]),
      );

  Map<String, dynamic> toMap() => {
        "teamId": teamId,
        "spell1Id": spell1Id,
        "spell2Id": spell2Id,
        "championId": championId,
        "profileIconId": profileIconId,
        "summonerName": summonerName,
        "bot": bot,
        "summonerId": summonerId,
        "gameCustomizationObjects":
            List<dynamic>.from(gameCustomizationObjects.map((x) => x)),
        "perks": perks.toMap(),
      };
}

class Perks {
  final List<int> perkIds;
  final int perkStyle;
  final int perkSubStyle;

  Perks({
    required this.perkIds,
    required this.perkStyle,
    required this.perkSubStyle,
  });

  factory Perks.fromMap(Map<String, dynamic> json) => Perks(
        perkIds: List<int>.from(json["perkIds"].map((x) => x)),
        perkStyle: json["perkStyle"],
        perkSubStyle: json["perkSubStyle"],
      );

  Map<String, dynamic> toMap() => {
        "perkIds": List<dynamic>.from(perkIds.map((x) => x)),
        "perkStyle": perkStyle,
        "perkSubStyle": perkSubStyle,
      };
}
