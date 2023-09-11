import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/items_item.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemList extends StatefulWidget {
  final ItemCubit itemCubit;

  const ItemList({super.key, required this.itemCubit});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  //late Future<List<ItemModel>> __itemListFuture;

  @override
  void initState() {
    super.initState();
    widget.itemCubit.getItems();

    // __itemListFuture = LolApi.getItemList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      buildWhen: (previous, current) {
        if (current.needRefresh) {
          widget.itemCubit.changeRefresh(false);
          return true;
        }
        return previous != current;
      },
      bloc: widget.itemCubit,
      builder: (context, ItemState state) {
        if (state.status == Status.loading) {
          return Center(
            child: CustomLoadingWidget(),
          );
        } else if (state.status == Status.loaded) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 3 : 5),
            itemCount: state.itemList.length,
            itemBuilder: (BuildContext context, int index) => ItemsItem(
              item: state.itemList[index],
              itemCubit: widget.itemCubit,
            ),
          );
        } else {
          return const Center(
            child: Text('Hata 404'),
          );
        }
      },
    );
  }
}
