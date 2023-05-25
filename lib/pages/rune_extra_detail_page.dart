import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:html/parser.dart';

class RuneExtraDetailPage extends StatefulWidget {
  final index;
  final RuneModel rune;
  final num;
  const RuneExtraDetailPage({
    super.key,
    required this.rune,
    this.index,
    this.num,
  });

  @override
  State<RuneExtraDetailPage> createState() => _RuneExtraDetailPageState();
}

class _RuneExtraDetailPageState extends State<RuneExtraDetailPage> {
  @override
  Widget build(BuildContext context) {
    String textRuneInfo =
        parse(widget.rune.slots[widget.num].runes[widget.index].longDesc)
            .body!
            .text;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://ddragon.canisback.com/img/${widget.rune.slots[widget.num].runes[widget.index].icon}"),
                      fit: BoxFit.fill),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(110),
                  ),
                  border: Border.all(color: Colors.lime, width: 3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.rune.slots[widget.num].runes[widget.index].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  border: Border.all(color: Colors.lime, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Html(
                    data: widget
                        .rune.slots[widget.num].runes[widget.index].longDesc,
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
                        "scalead",
                        "lol-uikit-tooltipped-keyword",
                        "font"
                      ]),
                    style: {
                      "maintext":
                          Style(fontSize: FontSize.large, color: Colors.white),
                      "stats":
                          Style(fontSize: FontSize.large, color: Colors.white),
                      "attention":
                          Style(fontSize: FontSize.large, color: Colors.lime),
                      "passive":
                          Style(fontSize: FontSize.large, color: Colors.lime),
                      "raritymythic":
                          Style(fontSize: FontSize.large, color: Colors.orange),
                      "raritylegendary": Style(
                          fontSize: FontSize.large, color: Colors.redAccent),
                      "rules": Style(
                          fontSize: FontSize.large, color: Colors.deepOrange),
                      "speed": Style(fontSize: FontSize.large, color: Colors.red),
                      "status":
                          Style(fontSize: FontSize.large, color: Colors.lime),
                      "ornnbonus":
                          Style(fontSize: FontSize.large, color: Colors.lime),
                      "keywordstealth":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "flavortext":
                          Style(fontSize: FontSize.large, color: Colors.pink),
                      "scaleap":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "scalead":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "onhit": Style(fontSize: FontSize.large, color: Colors.red),
                      "physicaldamage":
                          Style(fontSize: FontSize.large, color: Colors.blue),
                      "scalemr":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "scalearmor":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "scalemana":
                          Style(fontSize: FontSize.large, color: Colors.blue),
                      "raritygeneric":
                          Style(fontSize: FontSize.large, color: Colors.blue),
                      "magicdamage":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "active":
                          Style(fontSize: FontSize.large, color: Colors.lime),
                      "scalehealth":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "keywordmajor":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "shield":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "font":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "truedamage":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "lol-uikit-tooltipped-keyword":
                          Style(fontSize: FontSize.large, color: Colors.red),
                      "li": Style(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.all(10),
                      ),
                    },
                    customRender: {
                      "maintext": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "stats": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "attention": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "lol-uikit-tooltipped-keyword": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "passive": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "raritymythic": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "raritylegendary": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "rules": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "speed": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "status": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "ornnbonus": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "keywordstealth": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "flavortext": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "scaleap": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "font": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "scalead": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "onhit": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "physicaldamage": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "scalearmor": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "scalemr": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "scalemana": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "raritygeneric": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "magicdamage": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "active": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "scalehealth": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "keywordmajor": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "shield": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                      "truedamage": (context, parsedChild) {
                        Text(widget
                            .rune.slots[widget.num].runes[widget.index].longDesc);
                      },
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
