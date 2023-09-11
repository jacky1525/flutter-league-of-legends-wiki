part of 'spell_cubit.dart';

abstract class SpellState extends Equatable {
  List<SummonerSpellModel> spellList;
  final Status status;

  SpellState({required this.spellList, required this.status});

  SpellState copyWith({
    List<SummonerSpellModel>? spellList,
    Status? status,
  }) {
    return SpellInitial(
      spellList: spellList ?? this.spellList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [spellList, status];
}

class SpellInitial extends SpellState {
  SpellInitial({
    required List<SummonerSpellModel> spellList,
    required Status status,
  }) : super(spellList: spellList, status: status);
}
