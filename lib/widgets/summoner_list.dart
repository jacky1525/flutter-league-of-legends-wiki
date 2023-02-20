import 'package:flutter/material.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/summoner_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummonerList extends StatefulWidget {
  const SummonerList({super.key});

  @override
  State<SummonerList> createState() => _SummonerListState();
}

class _SummonerListState extends State<SummonerList> {
  late Future<List<SummonerSpellModel>> __summonerListFuture;

  @override
  void initState() {
    super.initState();
    __summonerListFuture = LolApi.getSummonerSpellList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: __summonerListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SummonerSpellModel> myList = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 4 : 8),
            itemCount: myList.length - 2,
            itemBuilder: (BuildContext context, int index) => SummonerItem(
              spell: myList[index],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata 404'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
