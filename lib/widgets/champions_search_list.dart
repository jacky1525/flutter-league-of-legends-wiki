// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/pages/champion_skins_page.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/main/cubit_cubit.dart';
import '../pages/champion_detail_page.dart';

class ChampionSearchList extends StatefulWidget {
  final ChampionsModel? champion;

  const ChampionSearchList({super.key, this.champion});

  @override
  State<ChampionSearchList> createState() => _ChampionSearchListState();
}

class _ChampionSearchListState extends State<ChampionSearchList> {
  late CubitCubit cubit;
  Future<List<ChampionInfoModel>> getChampionSearchList() async {
    List<ChampionInfoModel> ChampionSearchList = [];
    String championOutUrl =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/data/en_US/champion/${widget.champion!.id}.json';

    var response = await Dio().get(championOutUrl);

    var list = [];

    if (response.statusCode == 200) {
      var ma = Map<String, dynamic>.from(response.data["data"]);
      ma.forEach(
        (key, value) {
          list.add(value);
        },
      );
      ChampionSearchList = List<ChampionInfoModel>.from(
          list.map((e) => ChampionInfoModel.fromMap(e))).toList();
    } else {
      return [];
    }

    return ChampionSearchList;
  }

  late Future<List<ChampionInfoModel>> _ChampionSearchListFuture;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CubitCubit>(context);
    _ChampionSearchListFuture = getChampionSearchList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ChampionSearchListFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ChampionInfoModel> myInfoList = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myInfoList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.625,
              crossAxisCount:
                  ScreenUtil().orientation == Orientation.portrait ? 1 : 1,
              mainAxisExtent: ScreenUtil().orientation == Orientation.portrait
                  ? 1000
                  : 1000,
            ),
            itemBuilder: (context, index) => ChampionDetailPage(
              cubit: cubit,
              championInfo: myInfoList[index],
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
