part of 'tft_champion_cubit.dart';

abstract class TftChampionState extends Equatable {
  List<TftChampionModel> tftChampionModelList;
  final Status status;
  final bool needRefresh;
  final Color tierColor;
  final Color nameColor;

  TftChampionState({
    required this.tftChampionModelList,
    required this.status,
    required this.needRefresh,
    required this.tierColor,
    required this.nameColor,
  });

  TftChampionState copyWith({
    List<TftChampionModel>? tftChampionModelList,
    Status? status,
    bool? needRefresh,
    Color? tierColor,
    Color? nameColor,
  }) {
    return TftChampionInitial(
      tftChampionModelList: tftChampionModelList ?? this.tftChampionModelList,
      status: status ?? this.status,
      needRefresh: needRefresh ?? this.needRefresh,
      tierColor: tierColor ?? this.tierColor,
      nameColor: nameColor ?? this.nameColor,
    );
  }

  @override
  List<Object> get props =>
      [tftChampionModelList, status, needRefresh, tierColor, nameColor];
}

class TftChampionInitial extends TftChampionState {
  TftChampionInitial({
    required List<TftChampionModel> tftChampionModelList,
    required Status status,
    required bool needRefresh,
    required Color tierColor,
    required Color nameColor,
  }) : super(
          tftChampionModelList: tftChampionModelList,
          status: status,
          needRefresh: needRefresh,
          tierColor: tierColor,
          nameColor: nameColor,
        );
}
