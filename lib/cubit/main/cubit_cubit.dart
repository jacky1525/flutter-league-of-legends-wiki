import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/services/services.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit()
      : super(CubitInitial(
          selectedPageItem: 0,
          showButton: false,
          scrollVisibility: false,
          color: Colors.transparent,
          championName: "",
          championList: [],
          searchChampionList: [],
          status: Status.initial,
          isLoading: true
        ));

  void setPage(int selectedPageItem) {
    emit(state.copyWith(selectedPageItem: selectedPageItem));
  }

  void showButton(bool value) {
    emit(state.copyWith(showButton: value));
  }

  void showScrol(bool value) {
    emit(state.copyWith(scrollVisibility: value));
  }

  void setColor(Color color,bool isLoading){
    emit(state.copyWith(color: color,isLoading: isLoading));
  }

  void setChampionName(String value) {
    emit(state.copyWith(championName: value));
  }

  void setChampionList(List<ChampionsModel> list) {
    emit(state.copyWith(championList: list));
  }

  void getChampionsModel() async {
    emit(state.copyWith(status: Status.loading));
    try {
      Future.delayed(Duration(seconds: 10));
      final championsModelData = await LolApi.getChampionList();
      emit(state.copyWith(
          championList: championsModelData,
          searchChampionList: championsModelData,
          status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  void searchChampion(List<ChampionsModel> list, String value) {
    List<ChampionsModel> searchList = Services().searchChampions(list, value);
    emit(state.copyWith(searchChampionList: searchList));
  }
}
