import 'package:flutter/material.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/items_item.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late Future<List<ItemModel>> __itemListFuture;

  @override
  void initState() {
    super.initState();
    __itemListFuture = LolApi.getItemList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: __itemListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ItemModel> myList = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 3 : 5),
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) =>
                ItemsItem(item: myList[index]),
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
