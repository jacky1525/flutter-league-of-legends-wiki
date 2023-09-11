import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/services/services.dart';
import 'package:flutter_json/widgets/app_title_item.dart';
import 'package:flutter_json/widgets/item_list.dart';

class ItemsPage extends StatefulWidget {
  final ItemCubit itemCubit;

  const ItemsPage({super.key, required this.itemCubit});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitleItem(
            itemCubit: widget.itemCubit,
          ),
          Expanded(
            child: ItemList(itemCubit: widget.itemCubit),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            showScreen(context, widget.itemCubit);
          },
          child: const Icon(
            Icons.menu,
            size: 28,
            color: Colors.lime,
          ),
        ),
      ),
    );
  }
}
