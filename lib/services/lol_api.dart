// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/model/tft_champion.dart';

import '../constants/constants.dart';
import '../model/base_response.dart';

class LolApi {
  Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
  ));

  BaseResponse dioErrorBaseResponse(DioError? e) {
    if (e != null && e.response != null) {
      if (e.response!.statusCode != 502) {
        return BaseResponse.fromJson(e.response!);
      } else {
        return BaseResponse(
          data: [],
        );
      }
    } else {
      return BaseResponse(
        data: [],
      );
    }
  }

  static late ChampionsModel champion;

  static const String _ChampionsUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/champion.json';

  static Future<List<ChampionsModel>> getChampionList() async {
    List<ChampionsModel> championList = [];

    var response = await Dio().get(
      _ChampionsUrl,
    );

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

  Future<BaseResponse> getSummonerSpellList() async {
    String _summonerUrl =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/summoner.json';
    try {
      final Response response = await dio.get(_summonerUrl);
      return BaseResponse.fromJson(response);
    } on DioError catch (e) {
      return dioErrorBaseResponse(e);
    }
  }

  Future<BaseResponse> getRuneList() async {
    String _runeUrl =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/runesReforged.json';
    try {
      final Response response = await dio.get(_runeUrl);
      return BaseResponse.fromJson(response);
    } on DioError catch (e) {
      return dioErrorBaseResponse(e);
    }

    /* List<RuneModel> runeList = [];

    var response = await Dio().get(_runeUrl);

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
    return runeList; */
  }

  Future<BaseResponse> getSumName(
      String location, String summonerName, BuildContext context) async {
    try {
      String _reqUrl =
          'https://${location}1.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName?api_key=${Constants.RGAPI}';

      final Response response = await dio.get(_reqUrl);
      return BaseResponse.fromJson(response);
    } on DioError catch (e) {
      return dioErrorBaseResponse(e);
    }
  }

  Future<BaseResponse> getChampionMaster(
      String location, String summonerId) async {
    try {
      String _reqUrl =
          "https://${location}1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/$summonerId?api_key=${Constants.RGAPI}";
      final Response response = await dio.get(_reqUrl);
      return BaseResponse.fromJson(response);
    } on DioError catch (e) {
      return dioErrorBaseResponse(e);
    }
  }

  Future<BaseResponse> getInGame(String location, String summonerId) async {
    try {
      String _reqUrl =
          "https://${location}1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/${summonerId}?api_key=${Constants.RGAPI}";
      final Response response = await dio.get(_reqUrl);
      print(response);
      return BaseResponse.fromJson(response);
    } on DioError catch (e) {
      return dioErrorBaseResponse(e);
    }
  }

  static const String _itemUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/item.json';

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
      itemList =
          List<ItemModel>.from(list.map((e) => ItemModel.fromMap(e))).toList();
    } else {
      return [];
    }
    return itemList;
  }

  static const String _tftChampionUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.14.1/data/en_US/tft-champion.json';

  static Future<List<TftChampionModel>> getTftChampionList() async {
    List<TftChampionModel> tftChampionList = [];

    var response = await Dio().get(_tftChampionUrl);

    var list = [];

    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      tftChampionList = List<TftChampionModel>.from(
          list.map((e) => TftChampionModel.fromMap(e))).toList();
    } else {
      return [];
    }
    return tftChampionList;
  }

  static String championOutUrl =
      'http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/champion/${champion.id}.json';

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
