import 'package:flutter/material.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_json/widgets/rune_item.dart';

class RuneList extends StatefulWidget {
  const RuneList({
    super.key,
  });

  @override
  State<RuneList> createState() => _RuneListState();
}

class _RuneListState extends State<RuneList> {
  late Future<List<RuneModel>> __runeListFuture;

  @override
  void initState() {
    super.initState();
    __runeListFuture = LolApi.getRuneList();
  }

  @override
  Widget build(BuildContext context) {
    var index;
    return FutureBuilder(
      future: __runeListFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<RuneModel> myList = snapshot.data!;
          return ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: Colors.lime,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          RuneItem(
                        rune: myList[index],
                        index: index,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata 404'),
          );
        } else {
          return  Center(
            child: CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
