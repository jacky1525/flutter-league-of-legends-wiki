import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/widgets/champions_search_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChampionSearchItem extends StatelessWidget {
  final ChampionsModel? champion;

  const ChampionSearchItem({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var championSplash =
        'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion!.id}_0.jpg';
    return Column(
      children: [
        Text(
          champion!.name,
          style: Constants.championSearchNameStyle(),
        ),
        InkWell(
          splashColor: Colors.lime,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChampionSearchList(
                  champion: champion,
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.w),
            ),
            elevation: 0,
            shadowColor: Colors.red,
            color: Colors.transparent,
            child: Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(championSplash), fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.transparent,
                    label: Text(
                      champion!.title,
                      style: Constants.championSearchTagStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
          color: Colors.lime,
        )
      ],
    );
  }
}
