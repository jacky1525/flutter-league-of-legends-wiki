import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/cubit/summoner/summoner_cubit.dart';
import 'package:flutter_json/model/game_status.dart';
import '../model/rune_model.dart';
import '../model/summoner_model.dart';
import '../services/lol_api.dart';

class LiveGame extends StatefulWidget {
  final SummonerCubit summonerCubit;
  final LolApi dioClient;
  const LiveGame(
      {super.key, required this.summonerCubit, required this.dioClient});

  @override
  State<LiveGame> createState() => _LiveGameState();
}

class _LiveGameState extends State<LiveGame> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return widget.summonerCubit.getSummonerData(
            widget.summonerCubit.state.location,
            widget.summonerCubit.state.summonerName,
            context,
            widget.dioClient);
      },
      child: Scaffold(
        body: BlocBuilder<SummonerCubit, SummonerState>(
          bloc: widget.summonerCubit,
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 75, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.gameStatus.gameMode,
                      style: const TextStyle(color: Colors.lime, fontSize: 24),
                    ),
                    Container(
                      width: width,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Red Team",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  state.gameStatus.participants.length ~/ 2,
                              itemBuilder: (context, index) {
                                List<Participant> redList =
                                    state.gameStatus.participants
                                        .where(
                                          (summoner) => summoner.teamId == 200,
                                        )
                                        .toList();
                                return redSummonerItem(width, redList[index],
                                    state.spellList, state.runeList);
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Blue Team",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  state.gameStatus.participants.length ~/ 2,
                              itemBuilder: (context, index) {
                                List<Participant> blueList =
                                    state.gameStatus.participants
                                        .where(
                                          (summoner) => summoner.teamId == 100,
                                        )
                                        .toList();
                                return blueSummonerItem(width, blueList[index],
                                    state.spellList, state.runeList);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding redSummonerItem(double width, Participant summoner,
      List<SummonerSpellModel> spellList, List<RuneModel> runeList) {
    SummonerSpellModel? spell1;
    for (SummonerSpellModel spell in spellList) {
      bool spellControl = spell.key == summoner.spell1Id.toString();
      if (spellControl) {
        spell1 = spell;
        break;
      }
    }
    SummonerSpellModel? spell2;
    for (SummonerSpellModel spell in spellList) {
      bool spellControl = spell.key == summoner.spell2Id.toString();
      if (spellControl) {
        spell2 = spell;
        break;
      }
    }

    RuneModel? perkStyle;
    for (RuneModel rune in runeList) {
      bool runeControl = rune.id == summoner.perks.perkStyle;
      if (runeControl) {
        perkStyle = rune;
        break;
      }
    }

    RuneModel? perkSubStyle;
    for (RuneModel rune in runeList) {
      bool runeControl = rune.id == summoner.perks.perkSubStyle;
      if (runeControl) {
        perkSubStyle = rune;
        break;
      }
    }

    String championIcon =
        "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/${summoner.championId}.png";
    String spell1Icon =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${spell1!.image.full}";
    String spell2Icon =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${spell2!.image.full}";
    String perkIcon = "https://ddragon.canisback.com/img/${perkStyle!.icon}";
    String perkSubIcon =
        "https://ddragon.canisback.com/img/${perkSubStyle!.icon}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: width * 0.9,
        child: Row(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.lime),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: NetworkImage(championIcon))),
            ),
            const SizedBox(width: 10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 10,
              direction: Axis.vertical,
              children: [
                Text(
                  summoner.summonerName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(spell1Icon))),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(spell2Icon))),
                        ),
                      ],
                    )),
                    const VerticalDivider(
                      width: 5,
                      color: Colors.lime,
                    ),
                    Container(
                        child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(perkIcon))),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(perkSubIcon))),
                        ),
                      ],
                    )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding blueSummonerItem(double width, Participant summoner,
      List<SummonerSpellModel> spellList, List<RuneModel> runeList) {
    SummonerSpellModel? spell1;
    for (SummonerSpellModel spell in spellList) {
      bool spellControl = spell.key == summoner.spell1Id.toString();
      if (spellControl) {
        spell1 = spell;
        break;
      }
    }
    SummonerSpellModel? spell2;
    for (SummonerSpellModel spell in spellList) {
      bool spellControl = spell.key == summoner.spell2Id.toString();
      if (spellControl) {
        spell2 = spell;
        break;
      }
    }

    RuneModel? perkStyle;
    for (RuneModel rune in runeList) {
      bool runeControl = rune.id == summoner.perks.perkStyle;
      if (runeControl) {
        perkStyle = rune;
        break;
      }
    }

    RuneModel? perkSubStyle;
    for (RuneModel rune in runeList) {
      bool runeControl = rune.id == summoner.perks.perkSubStyle;
      if (runeControl) {
        perkSubStyle = rune;
        break;
      }
    }

    String championIcon =
        "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/${summoner.championId}.png";
    String spell1Icon =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${spell1!.image.full}";
    String spell2Icon =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${spell2!.image.full}";
    String perkIcon = "https://ddragon.canisback.com/img/${perkStyle!.icon}";
    String perkSubIcon =
        "https://ddragon.canisback.com/img/${perkSubStyle!.icon}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: width * 0.9,
        child: Row(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.lime),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: NetworkImage(championIcon))),
            ),
            const SizedBox(width: 10),
            Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 10,
              children: [
                Text(
                  summoner.summonerName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(spell1Icon))),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(spell2Icon))),
                        ),
                      ],
                    )),
                    const VerticalDivider(
                      width: 5,
                      color: Colors.lime,
                    ),
                    Container(
                        child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(perkIcon))),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(perkSubIcon))),
                        ),
                      ],
                    )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
