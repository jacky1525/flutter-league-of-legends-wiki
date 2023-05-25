import 'package:flutter/material.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/pages/items_detail_page.dart';
import 'package:html/parser.dart';
import 'package:flutter_html/flutter_html.dart';

class ItemsItem extends StatelessWidget {
  final ItemModel item;
  const ItemsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String textItemName = parse(item.name).body!.text;
    var itemImage =
        'http://ddragon.leagueoflegends.com/cdn/13.10.1/img/item/${item.image.full}';
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetailPage(item: item),
              ),
            );
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lime, width: 2),
              image: DecorationImage(
                  image: NetworkImage(itemImage), fit: BoxFit.fill),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Text(textItemName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.lime,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
