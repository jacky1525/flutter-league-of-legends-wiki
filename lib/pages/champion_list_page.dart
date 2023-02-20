// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_json/widgets/app_title_champion.dart';
import 'package:flutter_json/widgets/champion_list.dart';

class ChampionsPage extends StatefulWidget {
  const ChampionsPage({
    Key? key,
    required this.scroll_visibility,
    required this.scrollController,
  }) : super(key: key);

  final bool scroll_visibility;
  final ScrollController scrollController;

  @override
  State<ChampionsPage> createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  final ScrollController scrollController = ScrollController();
  bool showButton = false;
  bool scroll_visibility = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      double showOffset = 10.0;

      if (scrollController.offset > showOffset &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        showButton = true;
        setState(() {});
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showButton = false;
        setState(() {});
      } else {
        showButton = false;
        setState(() {});
      }
    });

    scrollController.addListener(
      () {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          scroll_visibility = true;
        } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          scroll_visibility = false;
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            Visibility(
              visible: scroll_visibility,
              child: const AppTitleChampion(),
            ),
            Expanded(child: ChampionList(controller: scrollController)),
          ],
        ),
      ),
      floatingActionButton: _goTopButton(),
    );
  }

  AnimatedOpacity _goTopButton() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: showButton ? 1.0 : 0.0,
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: const Icon(
          Icons.arrow_upward_rounded,
          color: Colors.lime,
          size: 40,
        ),
        onPressed: () {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        },
      ),
    );
  }
}
