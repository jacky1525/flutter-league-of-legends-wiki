// ignore_for_file: non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json/pages/champion_list_page.dart';
import 'package:flutter_json/pages/items_page.dart';
import 'package:flutter_json/pages/runes_page.dart';
import 'package:flutter_json/pages/summoner_spells_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageItem = 0;
  late List<Widget> allPages;
  late RunePage runePage;
  late ItemsPage itemsPage;
  late SummonerSpellPage spellPage;
  late ChampionsPage championsPage;
  final ScrollController scrollController = ScrollController();

  bool scroll_visibility = true;

  @override
  void initState() {
    super.initState();
    runePage = RunePage();
    itemsPage = const ItemsPage();
    spellPage = const SummonerSpellPage();
    championsPage = ChampionsPage(
        scroll_visibility: scroll_visibility,
        scrollController: scrollController);
    allPages = [championsPage, spellPage, runePage, itemsPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allPages[selectedPageItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  bottomNavMenu() {
    return CurvedNavigationBar(
      color: Colors.lime,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      height: ScreenUtil().orientation == Orientation.portrait ? 60 : 40,
      animationDuration: const Duration(milliseconds: 500),
      onTap: (value) {
        setState(() {
          if (value == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChampionsPage(
                  scroll_visibility: scroll_visibility,
                  scrollController: scrollController),
            ));
          } else {
            selectedPageItem = value;
          }
        });
      },
      items: [
        Image.asset(
          'assets/icons/icons8-spartan-helmet-48.png',
          width: 25,
          height: 25,
        ),
        Image.asset(
          'assets/icons/SummonerFlash.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'assets/icons/7200_Domination.png',
          width: 25,
          height: 25,
        ),
        Image.asset(
          'assets/icons/icons8-body-armor-48.png',
          width: 25,
          height: 25,
        ),
      ],
    );
  }
}
