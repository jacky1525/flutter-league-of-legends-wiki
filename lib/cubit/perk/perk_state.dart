part of 'perk_cubit.dart';

abstract class PerkState extends Equatable {
  List<RuneModel> perkList;
  RuneModel perk;
  final Status status;
  PerkState({required this.perkList, required this.status, required this.perk});

  PerkState copyWith(
      {List<RuneModel>? perkList, Status? status, RuneModel? perk}) {
    return PerkInitial(
        perkList: perkList ?? this.perkList,
        status: status ?? this.status,
        perk: perk ?? this.perk);
  }

  @override
  List<Object> get props => [perkList, status, perk];
}

class PerkInitial extends PerkState {
  PerkInitial(
      {required List<RuneModel> perkList,
      required Status status,
      required RuneModel perk})
      : super(perkList: perkList, status: status, perk: perk);
}
