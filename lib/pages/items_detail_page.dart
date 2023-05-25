import 'package:flutter/material.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class ItemDetailPage extends StatelessWidget {
  final ItemModel item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String textItemInfo = parse(item.description).body!.text;

    var itemImage =
        'http://ddragon.leagueoflegends.com/cdn/13.10.1/img/item/${item.image.full}';
    String textItemName = parse(item.name).body!.text;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lime, width: 4),
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(image: NetworkImage(itemImage)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Text(
                        textItemName,
                        style: const TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Toplam : ${item.gold.total} altın (Taban : ${item.gold.base} altın)",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Html(
              data: item.description,
              tagsList: Html.tags
                ..addAll([
                  "maintext",
                  "stats",
                  "attention",
                  "passive",
                  "raritymythic",
                  "raritylegendary",
                  "rules",
                  "speed",
                  "status",
                  "ornnbonus",
                  "keywordstealth",
                  "flavortext",
                  "scaleap",
                  "onhit",
                  "physicaldamage",
                  "scalearmor",
                  "scalemr",
                  "scalemana",
                  "raritygeneric",
                  "magicdamage",
                  "active",
                  "scalehealth",
                  "keywordmajor",
                  "shield",
                  "truedamage",
                ]),
              style: {
                "maintext":
                    Style(fontSize: FontSize.large, color: Colors.white),
                "stats": Style(fontSize: FontSize.large, color: Colors.white),
                "attention":
                    Style(fontSize: FontSize.large, color: Colors.lime),
                "passive": Style(fontSize: FontSize.large, color: Colors.lime),
                "raritymythic":
                    Style(fontSize: FontSize.large, color: Colors.orange),
                "raritylegendary":
                    Style(fontSize: FontSize.large, color: Colors.redAccent),
                "rules":
                    Style(fontSize: FontSize.large, color: Colors.deepOrange),
                "speed": Style(fontSize: FontSize.large, color: Colors.red),
                "status": Style(fontSize: FontSize.large, color: Colors.lime),
                "ornnbonus":
                    Style(fontSize: FontSize.large, color: Colors.lime),
                "keywordstealth":
                    Style(fontSize: FontSize.large, color: Colors.red),
                "flavortext":
                    Style(fontSize: FontSize.large, color: Colors.pink),
                "scaleap": Style(fontSize: FontSize.large, color: Colors.red),
                "onhit": Style(fontSize: FontSize.large, color: Colors.red),
                "physicaldamage":
                    Style(fontSize: FontSize.large, color: Colors.blue),
                "scalemr": Style(fontSize: FontSize.large, color: Colors.red),
                "scalearmor":
                    Style(fontSize: FontSize.large, color: Colors.red),
                "scalemana":
                    Style(fontSize: FontSize.large, color: Colors.blue),
                "raritygeneric":
                    Style(fontSize: FontSize.large, color: Colors.blue),
                "magicdamage":
                    Style(fontSize: FontSize.large, color: Colors.red),
                "active": Style(fontSize: FontSize.large, color: Colors.lime),
                "scalehealth":
                    Style(fontSize: FontSize.large, color: Colors.red),
                "keywordmajor":
                    Style(fontSize: FontSize.large, color: Colors.red),
                "shield": Style(fontSize: FontSize.large, color: Colors.red),
                "truedamage":
                    Style(fontSize: FontSize.large, color: Colors.red),
                "li": Style(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(10),
                ),
              },
              customRender: {
                "maintext": (context, parsedChild) {
                  Text(item.description);
                },
                "stats": (context, parsedChild) {
                  Text(item.description);
                },
                "attention": (context, parsedChild) {
                  Text(item.description);
                },
                "passive": (context, parsedChild) {
                  Text(item.description);
                },
                "raritymythic": (context, parsedChild) {
                  Text(item.description);
                },
                "raritylegendary": (context, parsedChild) {
                  Text(item.description);
                },
                "rules": (context, parsedChild) {
                  Text(item.description);
                },
                "speed": (context, parsedChild) {
                  Text(item.description);
                },
                "status": (context, parsedChild) {
                  Text(item.description);
                },
                "ornnbonus": (context, parsedChild) {
                  Text(item.description);
                },
                "keywordstealth": (context, parsedChild) {
                  Text(item.description);
                },
                "flavortext": (context, parsedChild) {
                  Text(item.description);
                },
                "scaleap": (context, parsedChild) {
                  Text(item.description);
                },
                "onhit": (context, parsedChild) {
                  Text(item.description);
                },
                "physicaldamage": (context, parsedChild) {
                  Text(item.description);
                },
                "scalearmor": (context, parsedChild) {
                  Text(item.description);
                },
                "scalemr": (context, parsedChild) {
                  Text(item.description);
                },
                "scalemana": (context, parsedChild) {
                  Text(item.description);
                },
                "raritygeneric": (context, parsedChild) {
                  Text(item.description);
                },
                "magicdamage": (context, parsedChild) {
                  Text(item.description);
                },
                "active": (context, parsedChild) {
                  Text(item.description);
                },
                "scalehealth": (context, parsedChild) {
                  Text(item.description);
                },
                "keywordmajor": (context, parsedChild) {
                  Text(item.description);
                },
                "shield": (context, parsedChild) {
                  Text(item.description);
                },
                "truedamage": (context, parsedChild) {
                  Text(item.description);
                },
              },
            ),
          ],
        ),
      ),
    );
  }
}
/*
35 Saldırı Gücü
%30 Saldırı Hızı
300 Can
20 Yetenek Hızı
Üçlü Darbe: Saldırılar hareket hızı sağlar. Hedef bir şampiyonsa taban saldırı gücünü arttırır. Bu artış birikebilir.
Büyülükılıç: Bir yetenek kullandıktan sonraki ilk saldırın güçlenerek fazladan hasar verir.
İhtişamlı Pasif: Diğer tüm efsanevi eşyalara ilave sağlar: saldırı gücü, yetenek hızı ve hareket hızı
*/
