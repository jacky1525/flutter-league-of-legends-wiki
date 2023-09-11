part of 'cubit_cubit.dart';

abstract class CubitState extends Equatable {
  final int selectedPageItem;
  final bool showButton;
  final bool scrollVisibility;
  final Color color;
  final String championName;
  List<ChampionsModel> searchChampionList;
  final List<ChampionsModel> championList;
  final Status status;
  final bool isLoading;

  CubitState(
      {required this.selectedPageItem,
      required this.showButton,
      required this.scrollVisibility,
      required this.color,
      required this.championName,
      required this.championList,
      required this.searchChampionList,
      required this.status,
      required this.isLoading});

  @override
  List<Object> get props => [
        selectedPageItem,
        showButton,
        scrollVisibility,
        color,
        championName,
        championList,
        searchChampionList,
        status,
        isLoading
      ];

  CubitState copyWith(
      {int? selectedPageItem,
      bool? showButton,
      bool? scrollVisibility,
      Color? color,
      String? championName,
      List<ChampionsModel>? championList,
      List<ChampionsModel>? searchChampionList,
      Status? status,
      bool? isLoading}) {
    return CubitInitial(
        selectedPageItem: selectedPageItem ?? this.selectedPageItem,
        showButton: showButton ?? this.showButton,
        scrollVisibility: scrollVisibility ?? this.scrollVisibility,
        color: color ?? this.color,
        championName: championName ?? this.championName,
        championList: championList ?? this.championList,
        searchChampionList: searchChampionList ?? this.searchChampionList,
        status: status ?? this.status,
        isLoading: isLoading ?? this.isLoading);
  }
}

class CubitInitial extends CubitState {
  CubitInitial({
    required int selectedPageItem,
    required bool showButton,
    required bool scrollVisibility,
    required Color color,
    required String championName,
    required List<ChampionsModel> championList,
    required Status status,
    required List<ChampionsModel> searchChampionList,
    required bool isLoading,
  }) : super(
            color: color,
            selectedPageItem: selectedPageItem,
            showButton: showButton,
            scrollVisibility: scrollVisibility,
            championName: championName,
            championList: championList,
            searchChampionList: searchChampionList,
            status: status,
            isLoading: isLoading);
}
