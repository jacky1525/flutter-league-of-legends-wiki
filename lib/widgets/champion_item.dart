import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/widgets/champions_search_list.dart';
import 'package:flutter_json/widgets/champion_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChampionItem extends StatelessWidget {
  final ChampionsModel? champion;

  const ChampionItem({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChampionSearchList(
            champion: champion,
          ),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.black,
        color: Colors.transparent,
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                champion!.name,
                style: Constants.championNameStyle(),
              ),
              Chip(
                  label: Text(
                champion!.title,
                style: Constants.championTagStyle(),
              )),
              Padding(
                padding: UIHelper.getDefaultPadding(),
                child: ChampionIcon(
                  champion: champion!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
