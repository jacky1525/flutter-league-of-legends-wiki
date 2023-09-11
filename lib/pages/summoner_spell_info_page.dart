import 'package:flutter/material.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/widgets/app_title_summoner.dart';

class SummonerSpellInfoPage extends StatelessWidget {
  final SummonerSpellModel spell;
  const SummonerSpellInfoPage({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {
    var spellImage =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${spell.id}.png';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitleSummoner(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lime, width: 3),
                        image: DecorationImage(
                            image: NetworkImage(spellImage), fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(spell.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                "Summoner level: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                spell.summonerLevel.toString(),
                                style: const TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                "Cooldown:  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                spell.cooldownBurn,
                                style: const TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.lime, width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          spell.description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
