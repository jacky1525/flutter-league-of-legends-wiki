import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/pages/search_items_pagev2.dart';

class AppTitleItem extends StatelessWidget {
  final ItemCubit itemCubit;
  const AppTitleItem({super.key, required this.itemCubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleWH(),
      child: Padding(
        padding: UIHelper.getDefaultPadding(hValue: 30, wValue: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Constants.itemTitle,
              style: Constants.itemTitleStyle(),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchItemPageV2(
                      itemCubit: itemCubit,
                    ),
                  ),
                );
              },
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
