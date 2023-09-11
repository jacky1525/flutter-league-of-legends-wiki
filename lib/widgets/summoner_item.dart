import 'package:flutter/material.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/pages/summoner_spell_info_page.dart';

class SummonerItem extends StatelessWidget {
  final SummonerSpellModel spell;
  const SummonerItem({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {
    var spellImage =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${spell.id}.png';
    return InkWell(
      splashColor: Colors.lime,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SummonerSpellInfoPage(
              spell: spell,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lime, width: 2),
                image: DecorationImage(
                    image: NetworkImage(spellImage), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                    child: Text(spell.name,
                        style: const TextStyle(
                            color: Colors.lime,
                            fontSize: 13,
                            fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
