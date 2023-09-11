import 'package:flutter/material.dart';
import 'package:flutter_json/model/tft_champion.dart';

class TftChampionItem extends StatelessWidget {
  final TftChampionModel item;
  TftChampionItem({super.key, required this.item});

  Color tierColor = Colors.white;

  int tier = 0;

  setTierColor(int tier) {
    switch (tier) {
      case 5:
        return Colors.lime;
      case 4:
        return Colors.purple.shade700;
      case 3:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 1:
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color tierColor = setTierColor(item.tier);
    double width = MediaQuery.of(context).size.width;
    var image =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/tft-champion/${item.image.full}";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                width: width * 0.245,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: tierColor),
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                ),
              ),
              Positioned(
                child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: tierColor,
                        spreadRadius: 0,
                        blurRadius: 0,
                      )
                    ]),
                    child: Center(child: Text(item.tier.toString()))),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            item.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
