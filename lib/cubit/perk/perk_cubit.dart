import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/widgets/rune_list.dart';

import '../../constants/constants.dart';
import '../../services/lol_api.dart';

part 'perk_state.dart';

class PerkCubit extends Cubit<PerkState> {
  PerkCubit()
      : super(PerkInitial(
            perkList: [], status: Status.initial, perk: RuneModel.empty()));

   getPerks(
    LolApi dioClient,
  ) async {
    emit(state.copyWith(status: Status.loading));
 
    List<dynamic> list = [];
    List<RuneModel> runeList = [];
    final response = await dioClient.getRuneList();
    if (response.statusCode == 200) {
      list = response.data;
      runeList =
          List<RuneModel>.from(list.map((e) => RuneModel.fromJson(e))).toList();
      emit(state.copyWith(perkList: runeList, status: Status.loaded));
    }
  }
}
