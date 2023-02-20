import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';

class AppTitleSummoner extends StatelessWidget {
  const AppTitleSummoner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleWH(),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            Constants.summonerTitle,
            style: Constants.summonerTitleStyle(),
          ),
        ),
      ),
    );
  }
}
