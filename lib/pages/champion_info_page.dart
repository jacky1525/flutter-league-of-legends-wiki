import 'package:flutter/material.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/model/champions_model.dart';

class ChampionInfoPage extends StatelessWidget {
  final ChampionInfoModel championInfo;
  final ChampionsModel? champion;
  const ChampionInfoPage(
      {super.key, required this.championInfo, this.champion});

  @override
  Widget build(BuildContext context) {
    var imageChampion =
        'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/${championInfo.id}_0.jpg';
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(hintText: "example"),
              ),
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
