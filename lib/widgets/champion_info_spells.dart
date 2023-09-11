import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter_json/videos/champion_skills_videos_page_p.dart';
import 'package:flutter_json/videos/champion_skills_videos_page_q.dart';
import 'package:flutter_json/videos/champion_skills_videos_page_w.dart';

import '../model/champion_info_model.dart';
import '../videos/champion_skills_videos_page_e.dart';
import '../videos/champion_skills_videos_page_r.dart';

class ChampionInfoSpells extends StatelessWidget {
  final ChampionInfoModel championInfo;
  const ChampionInfoSpells({super.key, required this.championInfo});

  @override
  Widget build(BuildContext context) {
    String passiveImage =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/passive/${championInfo.passive.image.full}";
    String qImage =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${championInfo.spells[0].image.full}";
    String wImage =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${championInfo.spells[1].image.full}";
    String eImage =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${championInfo.spells[2].image.full}";
    String rImage =
        "http://ddragon.leagueoflegends.com/cdn/13.17.1/img/spell/${championInfo.spells[3].image.full}";
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Spells",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Passive",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                championInfo.passive.name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChampionSkillsVideosPage(
                                    championInfo: championInfo,
                                  )),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime, width: 2),
                              image: DecorationImage(
                                  image: NetworkImage(passiveImage),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                )
                              ]),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Html(
                      data: championInfo.passive.description,
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
                          "healing"
                        ]),
                      style: {
                        "body": Style(
                          fontSize: FontSize(16),
                        ),
                        "maintext":
                            Style(fontSize: FontSize(16), color: Colors.white),
                        "stats":
                            Style(fontSize: FontSize(16), color: Colors.white),
                        "attention":
                            Style(fontSize: FontSize(16), color: Colors.lime),
                        "passive":
                            Style(fontSize: FontSize(16), color: Colors.lime),
                        "raritymythic":
                            Style(fontSize: FontSize(16), color: Colors.orange),
                        "raritylegendary": Style(
                            fontSize: FontSize(16), color: Colors.redAccent),
                        "rules": Style(
                            fontSize: FontSize(16), color: Colors.deepOrange),
                        "speed":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "status":
                            Style(fontSize: FontSize(16), color: Colors.lime),
                        "ornnbonus":
                            Style(fontSize: FontSize(16), color: Colors.lime),
                        "keywordstealth":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "flavortext":
                            Style(fontSize: FontSize(16), color: Colors.pink),
                        "scaleap":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "onhit":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "physicaldamage":
                            Style(fontSize: FontSize(16), color: Colors.blue),
                        "scalemr":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "scalearmor":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "scalemana":
                            Style(fontSize: FontSize(16), color: Colors.blue),
                        "raritygeneric":
                            Style(fontSize: FontSize(16), color: Colors.blue),
                        "magicdamage":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "active":
                            Style(fontSize: FontSize(16), color: Colors.lime),
                        "scalehealth":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "keywordmajor":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "shield":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "truedamage":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "healing":
                            Style(fontSize: FontSize(16), color: Colors.red),
                        "li": Style(
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.all(10),
                        ),
                      },
                      customRender: {
                        "maintext": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "stats": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "attention": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "passive": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "raritymythic": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "raritylegendary": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "rules": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "speed": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "status": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "ornnbonus": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "keywordstealth": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "flavortext": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "scaleap": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "onhit": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "physicaldamage": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "scalearmor": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "scalemr": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "scalemana": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "raritygeneric": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "magicdamage": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "active": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "scalehealth": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "keywordmajor": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "shield": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "truedamage": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                        "healing": (context, parsedChild) {
                          Text(championInfo.passive.description);
                        },
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Q",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                championInfo.spells[0].name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChampionSkillsVideosPageQ(
                                  championInfo: championInfo)),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime, width: 2),
                              image: DecorationImage(
                                  image: NetworkImage(qImage),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 1.5,
                                  blurRadius: 2,
                                )
                              ]),
                              child: Icon(
                                Icons.play_arrow,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Html(
                      data: championInfo.spells[0].description,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "W",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                championInfo.spells[1].name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChampionsSkillVideosPageW(
                                  championInfo: championInfo)),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime, width: 2),
                              image: DecorationImage(
                                  image: NetworkImage(wImage),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 1.5,
                                  blurRadius: 2,
                                )
                              ]),
                              child: Icon(
                                Icons.play_arrow,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Html(
                      data: championInfo.spells[1].description,
                      style: {"body": Style(fontSize: FontSize(16))},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "E",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                championInfo.spells[2].name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChampionsSkillsVideosPageE(
                                  championInfo: championInfo)),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime, width: 2),
                              image: DecorationImage(
                                  image: NetworkImage(eImage),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 1.5,
                                  blurRadius: 2,
                                )
                              ]),
                              child: Icon(
                                Icons.play_arrow,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Html(
                      data: championInfo.spells[2].description,
                      style: {"body": Style(fontSize: FontSize(16))},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "R",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                championInfo.spells[3].name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ChampionSkillsVideosPageR(
                                  championInfo: championInfo)),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime, width: 2),
                              image: DecorationImage(
                                  image: NetworkImage(rImage),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 1.5,
                                  blurRadius: 2,
                                )
                              ]),
                              child: Icon(
                                Icons.play_arrow,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Html(
                      data: championInfo.spells[3].description,
                      style: {"body": Style(fontSize: FontSize(16))},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
