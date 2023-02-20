import 'package:flutter/material.dart';
import 'package:flutter_json/widgets/app_title_summoner.dart';
import 'package:flutter_json/widgets/summoner_list.dart';

class SummonerSpellPage extends StatelessWidget {
  const SummonerSpellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: const [
            AppTitleSummoner(),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: SummonerList(),
            )),
          ],
        ),
      ),
    );
  }
}
