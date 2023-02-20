import 'package:flutter/material.dart';
import 'package:flutter_json/widgets/app_title_item.dart';
import 'package:flutter_json/widgets/item_list.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppTitleItem(),
          Expanded(
            child: ItemList(),
          ),
        ],
      ),
    );
  }
}
