// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/model/summoner_model.dart';

class LolApi {
  static late ChampionsModel champion;

  static const String _ChampionsUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.1.1/data/tr_TR/champion.json';

  static Future<List<ChampionsModel>> getChampionList() async {
    List<ChampionsModel> championList = [];

    var response = await Dio().get(_ChampionsUrl);

    var list = [];

    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      championList =
          List<ChampionsModel>.from(list.map((e) => ChampionsModel.fromMap(e)))
              .toList();
    } else {
      return [];
    }

    return championList;
  }

  static const String _summonerUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.1.1/data/tr_TR/summoner.json';

  static Future<List<SummonerSpellModel>> getSummonerSpellList() async {
    List<SummonerSpellModel> summonerSpellList = [];

    var response = await Dio().get(_summonerUrl);

    var list = [];

    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      summonerSpellList = List<SummonerSpellModel>.from(
          list.map((e) => SummonerSpellModel.fromMap(e))).toList();
    } else {
      return [];
    }
    return summonerSpellList;
  }

  static const String _runeUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.1.1/data/tr_TR/runesReforged.json';

  static Future<List<RuneModel>> getRuneList() async {
    List<RuneModel> runeList = [];

    var response = await Dio().get(_runeUrl);

    var list = [];

    if (response.statusCode == 200) {
      var list = response.data;
      
      runeList = List<RuneModel>.from(
        list.map(
          (e) => RuneModel.fromMap(e),
        ),
      ).toList();
    } else {
      return [];
    }
    return runeList;
  }

  static const String _itemUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.1.1/data/tr_TR/item.json';

  static Future<List<ItemModel>> getItemList() async {
    List<ItemModel> itemList = [];

    var response = await Dio().get(_itemUrl);

    var list = [];

    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      itemList = List<ItemModel>.from(
          list.map((e) => ItemModel.fromMap(e))).toList();
    } else {
      return [];
    }
    return itemList;
  }

  static String championOutUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.1.1/data/tr_TR/champion/${champion.id}.json';

  static Future<List<ChampionInfoModel>> getChampionInfoList() async {
    List<ChampionInfoModel> championInfoList = [];

    var response = await Dio().get(championOutUrl);

    var list = [];

    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      championInfoList = List<ChampionInfoModel>.from(
          list.map((e) => ChampionInfoModel.fromMap(e))).toList();
    } else {
      return [];
    }

    return championInfoList;
  }
}
