import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/cubit/summoner/summoner_cubit.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_json/widgets/summoner_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';
import '../cubit/spell/spell_cubit.dart';

class SummonerList extends StatefulWidget {
  const SummonerList({super.key});

  @override
  State<SummonerList> createState() => _SummonerListState();
}

class _SummonerListState extends State<SummonerList> {
  LolApi dioClient = LolApi();
  late SpellCubit spellCubit;

  @override
  void initState() {
    super.initState();
    spellCubit = BlocProvider.of<SpellCubit>(context);
    spellCubit.getSpells(dioClient);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpellCubit, SpellState>(
      bloc: spellCubit,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return CustomLoadingWidget();
        } else if (state.status == Status.loaded) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 4 : 8),
            itemCount: state.spellList.length - 2,
            itemBuilder: (BuildContext context, int index) => SummonerItem(
              spell: state.spellList[index],
            ),
          );
        } else {
          return const Center(
            child: Text("404"),
          );
        }
      },
    );
  }
}
