import 'package:flutter/material.dart';

import '../model/champion_info_model.dart';

class ChampionInfoStatistics extends StatelessWidget {
  final ChampionInfoModel championInfo;
  const ChampionInfoStatistics({super.key, required this.championInfo});

  @override
  Widget build(BuildContext context) {
    var attackSpeed = (championInfo.stats.values.elementAt(18) * 17 * 0.01 +
            championInfo.stats.values.elementAt(19))
        .toStringAsFixed(2);
    var hpRegen = (championInfo.stats.values.elementAt(11) * 17 +
            championInfo.stats.values.elementAt(10))
        .toStringAsFixed(2);
    var armor = (championInfo.stats.values.elementAt(6) * 17 +
            championInfo.stats.values.elementAt(5))
        .toStringAsFixed(2);
    var mpRegen = (championInfo.stats.values.elementAt(13) * 17 +
            championInfo.stats.values.elementAt(12))
        .toStringAsFixed(2);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text("Can"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.entries.first.value.toInt()} - ${championInfo.stats.values.elementAt(1).toInt() * 17 + championInfo.stats.entries.first.value.toInt()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Can Yenileme"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(10)} - $hpRegen",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Mana"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(2).toInt()} - ${championInfo.stats.values.elementAt(3).toInt() * 17 + championInfo.stats.values.elementAt(2).toInt()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text("Mana Yenileme"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(12)} - $mpRegen",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Menzil"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(9).toInt()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Saldırı Hasarı"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(16).toInt()} - ${championInfo.stats.values.elementAt(17) * 17 + championInfo.stats.values.elementAt(16)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text("Saldırı Hızı"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(19).toStringAsFixed(2)} - $attackSpeed",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Zırh"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(5).toInt()} - $armor",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Büyü Direnci"),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${championInfo.stats.values.elementAt(7).toInt()} - ${championInfo.stats.values.elementAt(8) * 17 + championInfo.stats.values.elementAt(7)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            const Text("Hareket Hızı"),
            const SizedBox(
              height: 3,
            ),
            Text(
              championInfo.stats.values.elementAt(4).toInt().toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
