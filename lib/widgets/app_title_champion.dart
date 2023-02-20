import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/pages/search_champion_page.dart';

class AppTitleChampion extends StatelessWidget {
  const AppTitleChampion({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleWH(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.championTitle,
                style: Constants.championTitleStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                )),
                child: const Icon(
                  Icons.search_sharp,
                  size: 65,
                  color: Colors.lime,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
