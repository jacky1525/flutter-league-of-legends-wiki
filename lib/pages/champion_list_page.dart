// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_json/widgets/app_title_champion.dart';
import 'package:flutter_json/widgets/champion_list.dart';

import '../cubit/main/cubit_cubit.dart';

class ChampionsPage extends StatefulWidget {
  final CubitCubit cubit;
  const ChampionsPage({
    Key? key,
    required this.scroll_visibility,
    required this.scrollController,
    required this.cubit,
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
        widget.cubit.showButton(true);
        showButton = widget.cubit.state.showButton;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        widget.cubit.showButton(false);
        showButton = widget.cubit.state.showButton;
      } else {
        widget.cubit.showButton(false);
        showButton = widget.cubit.state.showButton;
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.cubit.showScrol(true);

        scroll_visibility = widget.cubit.state.scrollVisibility;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        widget.cubit.showScrol(false);
        scroll_visibility = widget.cubit.state.scrollVisibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            BlocBuilder<CubitCubit, CubitState>(
              bloc: widget.cubit,
              builder: (context, state) {
                return Visibility(
                  visible: scroll_visibility,
                  child: AppTitleChampion(cubit: widget.cubit),
                );
              },
            ),
            Expanded(child: ChampionList(controller: scrollController)),
          ],
        ),
      ),
      floatingActionButton: _goTopButton(),
    );
  }

  Widget _goTopButton() {
    return BlocBuilder<CubitCubit, CubitState>(
      bloc: widget.cubit,
      builder: (context, state) {
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
      },
    );
  }
}
