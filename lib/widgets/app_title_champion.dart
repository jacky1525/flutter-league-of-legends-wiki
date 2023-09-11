import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';

import 'package:flutter_json/pages/search_champion_pagev2.dart';

import '../cubit/main/cubit_cubit.dart';

class AppTitleChampion extends StatelessWidget {
  final CubitCubit cubit;
  const AppTitleChampion({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleWH(),
      child: Padding(
        padding: UIHelper.getDefaultPadding(hValue: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Constants.championTitle,
              style: Constants.championTitleStyle(),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchPagev2(cubit: cubit),
              )),
              child: const Icon(
                Icons.search_sharp,
                size: 42,
                color: Colors.lime,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
