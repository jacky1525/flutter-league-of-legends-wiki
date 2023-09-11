import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_json/model/champion_mastery.dart';
import 'package:flutter_json/model/game_status.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/model/sum_name_resp_model.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/pages/summoner_profile.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/services/services.dart';
import 'package:flutter_json/widgets/rune_list.dart';

part 'summoner_state.dart';

class SummonerCubit extends Cubit<SummonerState> {
  SummonerCubit()
      : super(
          SummonerInitial(
            summonerName: "",
            location: "NA",
            summoner: SummonerNameResp.empty(),
            championMasterList: [],
            gameStatus: GameStatus.empty(),
            gameStatusMessage: "",
            sumNameMessage: "",
            spellList: [],
            runeList: [],
          ),
        );

  getSummonerData(
    String location,
    String summonerName,
    BuildContext context,
    LolApi dioClient,
  ) async {
    final summonerResponse =
        await dioClient.getSumName(location, summonerName, context);
    String sumNameMessage = summonerResponse.statusMessage;
    emit(state.copyWith(sumNameMessage: sumNameMessage));
    print(state.sumNameMessage);
    if (summonerResponse.statusCode == 200) {
      SummonerNameResp summoner =
          SummonerNameResp.fromJson(summonerResponse.data);

      emit(state.copyWith(
        summoner: summoner,
      ));

      final gameStatusResponse =
          await dioClient.getInGame(location, state.summoner.id);

      String gameStatusMessage = gameStatusResponse.statusMessage;
      emit(state.copyWith(gameStatusMessage: gameStatusMessage));

      if (gameStatusResponse.statusCode == 200) {
        GameStatus gameStatus = GameStatus.fromMap(gameStatusResponse.data);
        emit(state.copyWith(gameStatus: gameStatus));
      }

      final championResponse =
          await dioClient.getChampionMaster(state.location, state.summoner.id);

      List<ChampionMaster> championMasterList = [];

      var list = championResponse.data;

      championMasterList = List<ChampionMaster>.from(
        list.map(
          (e) => ChampionMaster.fromJson(e),
        ),
      );

      emit(state.copyWith(championMasterList: championMasterList));
    } else {
      return sumNotFound(context);
    }
  }

  setLocation(String value) {
    emit(state.copyWith(location: value));
  }

  getSpell(
    List<SummonerSpellModel> spellList,
  ) {
    emit(state.copyWith(spellList: spellList));
  }

  getPerk(
    List<RuneModel> perkList,
  ) {
    emit(state.copyWith(runeList: perkList));
  }

  setSummonerName(String value) {
    emit(state.copyWith(summonerName: value));
  }
}
