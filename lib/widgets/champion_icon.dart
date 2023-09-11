import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/model/champions_model.dart';

class ChampionIcon extends StatelessWidget {
  final ChampionsModel champion;

  const ChampionIcon({super.key, required this.champion});

  

  @override
  Widget build(BuildContext context) {
    var championImage = 'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/champion/${champion.image.full}';
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        maxRadius: Constants.calculateIconSize(),
        minRadius: Constants.calculateIconSize(),
        backgroundImage: NetworkImage(championImage),
      ),
    );
  }
}
