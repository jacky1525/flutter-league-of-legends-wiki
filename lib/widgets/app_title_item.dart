import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/pages/search_items_page.dart';

class AppTitleItem extends StatelessWidget {
  const AppTitleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleWH(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.itemTitle,
                style: Constants.itemTitleStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchItemPage(),
                    ),
                  );
                },
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
