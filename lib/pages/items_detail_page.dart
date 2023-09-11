import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';

import 'package:flutter_json/model/item_model.dart';

//import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class ItemDetailPage extends StatelessWidget {
  final ItemCubit itemCubit;

  final ItemModel item;

  ItemDetailPage({super.key, required this.item, required this.itemCubit});

  List into = [];
  List from = [];

  List<ItemModel> intoList = [];
  List<ItemModel> fromList = [];

  void fromItem() {
/*     from = item.into.join(", ");
 */

    into.addAll(item.into);
    from.addAll(item.from);
    print(item.name);
    print("Tags : ${item.tags}");
    print("From : ${item.from}");
    print("Into : ${item.into}");
    String id = item.image.full.split(".")[0];
    print(id);
    if (into.isNotEmpty) {
      for (int i = 0; i < into.length; i++) {
        ItemModel intoItem = itemCubit.state.initialItemList.firstWhere(
          (item) => item.image.full.split(".")[0] == into[i],
        );
        intoList.add(intoItem);
      }
    }

    if (from.isNotEmpty) {
      for (int i = 0; i < from.length; i++) {
        ItemModel fromItem = itemCubit.state.initialItemList.firstWhere(
          (item) => item.image.full.split(".")[0] == from[i],
        );
        fromList.add(fromItem);
      }
    }

    /* 
    itemCubit.state.itemList.where((item) => item.from.ad)

    itemCubit.state.itemList.where((item) => item.from.); */
  }

  @override
  Widget build(BuildContext context) {
    fromItem();
    String textItemInfo = parse(item.description).body!.text;

    var itemImage =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/item/${item.image.full}';
    String textItemName = parse(item.name).body!.text;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Total : ${item.gold.total} gold (Base : ${item.gold.base} gold)",
                        style: const TextStyle(fontSize: 12),
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
                  "buffedstat",
                  "scalehealth",
                  "keywordmajor",
                  "shield",
                  "truedamage",
                  "unique",
                  "goldgain",
                  "nerfedstat",
                  "recast"
                ]),
              style: {
                "maintext":
                    Style(fontSize: FontSize.large, color: Colors.white),
                "stats": Style(fontSize: FontSize.large, color: Colors.white),
                "attention":
                    Style(fontSize: FontSize.large, color: Colors.lime),
                "passive": Style(fontSize: FontSize.large, color: Colors.lime),
                "nerfedstat":
                    Style(fontSize: FontSize.large, color: Colors.lime),
                "goldgain": Style(fontSize: FontSize.large, color: Colors.lime),
                "buffedstat":
                    Style(fontSize: FontSize.large, color: Colors.lime),
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
                "recast": Style(fontSize: FontSize.large, color: Colors.red),
                "unique": Style(fontSize: FontSize.large, color: Colors.red),
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
                  display: Display.BLOCK,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(10),
                ),
              },
              customRender: {
                "maintext": (context, parsedChild) {
                  Text(item.description);
                },
                "goldgain": (context, parsedChild) {
                  Text(item.description);
                },
                "nerfedstat": (context, parsedChild) {
                  Text(item.description);
                },
                "stats": (context, parsedChild) {
                  Text(item.description);
                },
                "recast": (context, parsedChild) {
                  Text(item.description);
                },
                "attention": (context, parsedChild) {
                  Text(item.description);
                },
                "buffedstat": (context, parsedChild) {
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
                "unique": (context, parsedChild) {
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                item.plaintext,
                style: Constants.championSearchTagStyle(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Into",
                style: TextStyle(color: Colors.lime, fontSize: 24),
              ),
            ),
            intoList.isNotEmpty == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: intoList.length,
                      itemBuilder: (context, index) {
                        var intoItemImage =
                            'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/item/${intoList[index].image.full}';
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ItemDetailPage(
                                      item: intoList[index],
                                      itemCubit: itemCubit);
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.lime, width: 2),
                                    borderRadius: BorderRadius.circular(0),
                                    image: DecorationImage(
                                        image: NetworkImage(intoItemImage)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  intoList[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "From",
                style: TextStyle(color: Colors.lime, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: fromList.isNotEmpty
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.lime, width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                  image: DecorationImage(
                                      image: NetworkImage(itemImage)),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                item.name,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: fromList.length,
                        itemBuilder: (context, index) {
                          var fromItemImage =
                              'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/item/${fromList[index].image.full}';
                          List secondFrom = [];
                          List<ItemModel> secondFromList = [];
                          secondFrom.addAll(fromList[index].from);

                          if (secondFrom.isNotEmpty) {
                            for (int i = 0; i < secondFrom.length; i++) {
                              ItemModel secondFromItem =
                                  itemCubit.state.initialItemList.firstWhere(
                                (item) =>
                                    item.image.full.split(".")[0] ==
                                    secondFrom[i],
                              );
                              secondFromList.add(secondFromItem);
                            }
                          }

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ItemDetailPage(
                                              item: fromList[index],
                                              itemCubit: itemCubit);
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.lime, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(fromItemImage)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        fromList[index].name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 50, top: 10),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: secondFromList.length,
                                    itemBuilder: (context, secondIndex) {
                                      var secondFromItemImage =
                                          'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/item/${secondFromList[secondIndex].image.full}';
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ItemDetailPage(
                                                      item: secondFromList[
                                                          secondIndex],
                                                      itemCubit: itemCubit);
                                                },
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.lime,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            secondFromItemImage)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(secondFromList[secondIndex]
                                                    .name),
                                              ],
                                            ),
                                          ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
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
