import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/services/lol_api.dart';

part 'spell_state.dart';

class SpellCubit extends Cubit<SpellState> {
  SpellCubit()
      : super(SpellInitial(spellList: const [], status: Status.initial));

   getSpells(
    LolApi dioClient,
  ) async {
    emit(state.copyWith(status: Status.loading));
    List<SummonerSpellModel> summonerSpellList = [];
    var list = [];
    final response = await dioClient.getSummonerSpellList();
    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      summonerSpellList = List<SummonerSpellModel>.from(
          list.map((e) => SummonerSpellModel.fromMap(e))).toList();
      emit(state.copyWith(spellList: summonerSpellList, status: Status.loaded));
    }
  }
}
