// ignore_for_file: non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/cubit/spell/spell_cubit.dart';
import 'package:flutter_json/pages/champion_list_page.dart';
import 'package:flutter_json/pages/items_page.dart';
import 'package:flutter_json/pages/runes_page.dart';
import 'package:flutter_json/pages/search_summoner.dart';
import 'package:flutter_json/pages/summoner_spells_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../cubit/main/cubit_cubit.dart';
import '../cubit/perk/perk_cubit.dart';
import '../cubit/summoner/summoner_cubit.dart';
import '../services/lol_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> allPages;
  late RunePage runePage;
  late ItemsPage itemsPage;
  late SummonerSpellPage spellPage;
  late ChampionsPage championsPage;
  late SearchSummoner searchSummoner;
  final ScrollController scrollController = ScrollController();
  late CubitCubit cubit;
  late ItemCubit itemCubit;
  bool scroll_visibility = true;
  late PerkCubit perkCubit;
  LolApi dioClient = LolApi();
  late SpellCubit spellCubit;
  late SummonerCubit summonerCubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CubitCubit>(context);
    itemCubit = BlocProvider.of<ItemCubit>(context);
    searchSummoner = const SearchSummoner();
    runePage = const RunePage();
    itemsPage = ItemsPage(
      itemCubit: itemCubit,
    );
    spellPage = const SummonerSpellPage();
    championsPage = ChampionsPage(
        cubit: cubit,
        scroll_visibility: scroll_visibility,
        scrollController: scrollController);
    allPages = [searchSummoner, championsPage, spellPage, runePage, itemsPage];
    perkCubit = BlocProvider.of<PerkCubit>(context);
    spellCubit = BlocProvider.of<SpellCubit>(context);
    summonerCubit = BlocProvider.of<SummonerCubit>(context);
    getPerk();
    getSpell();
  }

  Future getPerk() async {
    await perkCubit.getPerks(dioClient);
    summonerCubit.getPerk(perkCubit.state.perkList);
  }

  Future getSpell() async {
    await spellCubit.getSpells(dioClient);
    summonerCubit.getSpell(spellCubit.state.spellList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CubitCubit, CubitState>(
        bloc: cubit,
        builder: (context, CubitState state) {
          return allPages[state.selectedPageItem];
        },
      ),
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  bottomNavMenu() {
    return CurvedNavigationBar(
      color: Colors.lime,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      height: ScreenUtil().orientation == Orientation.portrait ? 50 : 45,
      animationDuration: const Duration(milliseconds: 500),
      index: cubit.state.selectedPageItem,
      onTap: (value) {
        cubit.setPage(value);
      },
      items: [
        Image.asset(
          'assets/icons/search_profile.png',
          width: 25,
          height: 25,
        ),
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
