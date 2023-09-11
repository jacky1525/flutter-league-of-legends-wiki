import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/cubit/summoner/summoner_cubit.dart';
import 'package:flutter_json/pages/live_match.dart';

import '../services/lol_api.dart';

class SummonerProfile extends StatefulWidget {
  const SummonerProfile({super.key});

  @override
  State<SummonerProfile> createState() => _SummonerProfileState();
}

class _SummonerProfileState extends State<SummonerProfile> {
  LolApi dioClient = LolApi();
  late SummonerCubit summonerCubit;

  @override
  void initState() {
    super.initState();
    summonerCubit = BlocProvider.of<SummonerCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    String championSplash = "";
    String profileIcon =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/profileicon/${summonerCubit.state.summoner.profileIconId}.png";
    if (summonerCubit.state.championMasterList.isNotEmpty) {
      championSplash =
          "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-splashes/${summonerCubit.state.championMasterList.first.championId}/${summonerCubit.state.championMasterList.first.championId}000.jpg";
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<SummonerCubit, SummonerState>(
        bloc: summonerCubit,
        builder: (context, state) {
          print("This is test message");
          print(state.summoner.name);
          print(state.summoner.id);
          print(state.spellList);
          print(state.runeList);
          return Column(
            children: [
              Container(
                  decoration: state.championMasterList.isNotEmpty
                      ? BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(championSplash),
                              fit: BoxFit.cover))
                      : BoxDecoration(),
                  width: width,
                  height: height * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              width: 75,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(profileIcon),
                                    radius: 32,
                                  ),
                                  Positioned(
                                      top: 50,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade800,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.lime)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              state.summoner.summonerLevel
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: width * 0.6,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.summoner.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                state.gameStatusMessage == "OK"
                                    ? TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.grey.shade800,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                        child: const Text(
                                          "Currently in game",
                                          style: TextStyle(color: Colors.lime),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) {
                                              return LiveGame(
                                                summonerCubit: summonerCubit,
                                                dioClient: dioClient,
                                              );
                                            },
                                          ));
                                        },
                                      )
                                    : const Text("Not in game")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
