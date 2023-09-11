import 'package:flutter/material.dart';
import 'package:flutter_json/tft/widgets/app_title_tft.dart';
import 'package:flutter_json/tft/widgets/tft_champion_list.dart';

class TFTPage extends StatelessWidget {
  const TFTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TftTitle(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: TftChampionList())
        ],
      ),
    );
  }
}
