import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/model/summoner_model.dart';
import 'package:flutter_json/pages/champion_skins_page.dart';
import 'package:flutter_json/widgets/champion_info_spells.dart';
import 'package:flutter_json/widgets/champion_info_statistics.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:palette_generator/palette_generator.dart';

import '../cubit/main/cubit_cubit.dart';

class ChampionDetailPage extends StatefulWidget {
  final CubitCubit cubit;
  final ChampionInfoModel championInfo;
  const ChampionDetailPage(
      {super.key, required this.championInfo, required this.cubit});

  @override
  State<ChampionDetailPage> createState() => _ChampionDetailPageState();
}

class _ChampionDetailPageState extends State<ChampionDetailPage> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    widget.cubit.setColor(appbarRengi, true);
    () async {
      await Future.delayed(const Duration(seconds: 1));
      await appbarRenginiBul();
    }();
  }

  @override
  Widget build(BuildContext context) {
    var championSplash =
        'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.championInfo.id}_0.jpg';
    return Scaffold(
      body: BlocBuilder<CubitCubit, CubitState>(
        bloc: widget.cubit,
        builder: (context, state) {
          if (state.isLoading) {
            return Container(
              height: 210,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(championSplash), fit: BoxFit.fill),
              ),
            );
          } else {
            return Container(
              color: Colors.transparent,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: state.color,
                    expandedHeight: 180,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.championInfo.name.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            widget.championInfo.title,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.limeAccent),
                          )
                        ],
                      ),
                      centerTitle: true,
                      background: Container(
                        height: 230,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(championSplash),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                                widget.championInfo.tags.length == 2
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.championInfo.tags[0],
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.championInfo.tags.length == 2
                                    ? widget.championInfo.tags[1]
                                    : "",
                                style: const TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "About Champion",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ChampionSkinsPage(
                                          championInfo: widget.championInfo),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Skins",
                                        style: TextStyle(
                                            color: Colors.limeAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ExpandableText(
                            widget.championInfo.lore,
                            expandText: 'More',
                            collapseText: 'Close',
                            maxLines: 3,
                            linkColor: Colors.lime,
                            style: const TextStyle(fontSize: 16.5),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ChampionInfoStatistics(
                          championInfo: widget.championInfo,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Difficulty",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * 0.90,
                                lineHeight: 5,
                                percent: widget.championInfo.info.difficulty
                                        .toDouble() /
                                    10,
                                backgroundColor: Colors.grey.shade500,
                                progressColor: Colors.limeAccent,
                              ),
                            ],
                          ),
                        ),
                        ChampionInfoSpells(
                          championInfo: widget.championInfo,
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(NetworkImage(
        "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.championInfo.id}_0.jpg"));
    appbarRengi = _generator.dominantColor!.color;
    if (mounted) {
      widget.cubit.setColor(appbarRengi, false);
    }
  }
}
