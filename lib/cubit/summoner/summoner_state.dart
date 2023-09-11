part of 'summoner_cubit.dart';

abstract class SummonerState extends Equatable {
  String summonerName;
  String location;
  SummonerNameResp summoner;
  List<ChampionMaster> championMasterList;
  GameStatus gameStatus;
  String gameStatusMessage;
  String sumNameMessage;
  List<SummonerSpellModel> spellList;
  List<RuneModel> runeList;
  SummonerState(
      {required this.summonerName,
      required this.location,
      required this.summoner,
      required this.championMasterList,
      required this.gameStatus,
      required this.gameStatusMessage,
      required this.sumNameMessage,
      required this.spellList,
      required this.runeList});

  SummonerState copyWith({
    String? summonerName,
    String? location,
    SummonerNameResp? summoner,
    List<ChampionMaster>? championMasterList,
    GameStatus? gameStatus,
    String? gameStatusMessage,
    String? sumNameMessage,
    List<SummonerSpellModel>? spellList,
    List<RuneModel>? runeList,
  }) {
    return SummonerInitial(
      summonerName: summonerName ?? this.summonerName,
      location: location ?? this.location,
      summoner: summoner ?? this.summoner,
      championMasterList: championMasterList ?? this.championMasterList,
      gameStatus: gameStatus ?? this.gameStatus,
      gameStatusMessage: gameStatusMessage ?? this.gameStatusMessage,
      sumNameMessage: sumNameMessage ?? this.sumNameMessage,
      spellList: spellList ?? this.spellList,
      runeList: runeList ?? this.runeList,
    );
  }

  @override
  List<Object> get props => [
        summonerName,
        location,
        summoner,
        championMasterList,
        gameStatus,
        gameStatusMessage,
        sumNameMessage,
        spellList,
        runeList
      ];
}

class SummonerInitial extends SummonerState {
  SummonerInitial({
    required String summonerName,
    required String location,
    required SummonerNameResp summoner,
    required List<ChampionMaster> championMasterList,
    required GameStatus gameStatus,
    required String gameStatusMessage,
    required String sumNameMessage,
    required List<SummonerSpellModel> spellList,
    required List<RuneModel> runeList,
  }) : super(
            summonerName: summonerName,
            location: location,
            summoner: summoner,
            championMasterList: championMasterList,
            gameStatus: gameStatus,
            gameStatusMessage: gameStatusMessage,
            sumNameMessage: sumNameMessage,
            spellList: spellList,
            runeList: runeList);
}
