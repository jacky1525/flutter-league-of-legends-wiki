import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/model/tft_champion.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/tft/widgets/tft_champion_list.dart';


part 'tft_champion_state.dart';

class TftChampionCubit extends Cubit<TftChampionState> {
  TftChampionCubit()
      : super(TftChampionInitial(
            tftChampionModelList: const [],
            status: Status.initial,
            needRefresh: false,
            tierColor: Colors.lime,
            nameColor: Colors.white));

  void getTftChampionList() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final tftChampionsModelData = await LolApi.getTftChampionList();
      tftChampionsModelData.sort((a, b) => a.tier.compareTo(b.tier));
      emit(state.copyWith(
          tftChampionModelList: tftChampionsModelData, status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  void sortByTier(bool value) {
    List<TftChampionModel> sortedList = state.tftChampionModelList;

    sortedList.sort((a, b) => a.tier.compareTo(b.tier));

    emit(state.copyWith(tftChampionModelList: sortedList));
    changeRefresh(value);
  }

  void sortByName(bool value) {
    List<TftChampionModel> sortedList = state.tftChampionModelList;

    sortedList.sort((a, b) => a.name.compareTo(b.name));

    emit(state.copyWith(tftChampionModelList: sortedList));
    changeRefresh(value);
  }

  void changeRefresh(bool value) {
    emit(state.copyWith(
      needRefresh: value,
    ));
  }

  void setColor({required Color tierColor, required Color nameColor}) {
    emit(state.copyWith(tierColor: tierColor, nameColor: nameColor));
  }
}
