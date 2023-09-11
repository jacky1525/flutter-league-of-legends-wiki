// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/champion_item.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChampionList extends StatefulWidget {
  final ScrollController controller;
  ChampionList({super.key, required this.controller});

  @override
  State<ChampionList> createState() => _ChampionListState();
}

class _ChampionListState extends State<ChampionList> {
  late final ChampionInfoModel championInfo;
  late Future<List<ChampionsModel>> _championsListFuture;

  @override
  void initState() {
    super.initState();
    _championsListFuture = LolApi.getChampionList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _championsListFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ChampionsModel> myList = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            controller: widget.controller,
            itemCount: myList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (context, index) => ChampionItem(
              champion: myList[index],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata 404'),
          );
        } else {
          return Center(
            child: CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
