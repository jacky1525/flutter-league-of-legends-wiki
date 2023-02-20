import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';

class AppTitleRune extends StatelessWidget {
  const AppTitleRune({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleRuneWH(),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            Constants.runeTitle,
            style: Constants.runeTitleStyle(),
          ),
        ),
      ),
    );
  }
}
