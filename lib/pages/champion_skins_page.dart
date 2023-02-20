import 'package:flutter/material.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/pages/champion_details_skin_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ChampionSkinsPage extends StatelessWidget {
  final ChampionInfoModel championInfo;
  const ChampionSkinsPage({super.key, required this.championInfo});

  @override
  Widget build(BuildContext context) {
    List splashs = [];
    for (int i = 0; i < championInfo.skins.length; i++) {
      var championSplash =
          'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/${championInfo.id}_${championInfo.skins[((championInfo.skins.length - 1) - i).abs()].num}.jpg';

      splashs.add(championSplash);
    }
    List reversedSplashs = splashs.reversed.toList();
    List namesList = [];
    for (int i = 0; i <= 162; i++) {
      namesList.add(championInfo.id);
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/valley2.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: PageView.builder(
            reverse: false,
            itemCount: championInfo.skins.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Shimmer.fromColors(
                      period: Duration(milliseconds: 2500),
                      baseColor: Colors.black,
                      highlightColor: Colors.lime,
                      child: Text(
                        textAlign: TextAlign.center,
                        championInfo.skins[index].name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 64, right: 64),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChampionDetailsSkinPage(
                                    img: reversedSplashs[index],
                                  )),
                        );
                      },
                      child: Container(
                        width: ScreenUtil().orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.width
                            : 140,
                        height: ScreenUtil().orientation == Orientation.portrait
                            ? 500
                            : 250,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 4),
                          image: DecorationImage(
                              image: NetworkImage(reversedSplashs[index]),
                              fit: BoxFit.scaleDown),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(7, 7),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


/*
Text(
                  textAlign: TextAlign.center,
                  championInfo.skins[index].name,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
*/


