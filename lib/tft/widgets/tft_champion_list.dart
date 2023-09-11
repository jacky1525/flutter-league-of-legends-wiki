import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/tft/widgets/tft_champion_item.dart';
import 'package:flutter_json/widgets/loading_widget.dart';

import '../../cubit/tft/tft_champion_cubit.dart';

class TftChampionList extends StatefulWidget {
  const TftChampionList({super.key});

  @override
  State<TftChampionList> createState() => _TftChampionListState();
}

class _TftChampionListState extends State<TftChampionList> {
  late TftChampionCubit tftChampionCubit;

  @override
  void initState() {
    super.initState();
    tftChampionCubit = BlocProvider.of<TftChampionCubit>(context);

    tftChampionCubit.getTftChampionList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TftChampionCubit, TftChampionState>(
      buildWhen: (previous, current) {
        if (current.needRefresh) {
          tftChampionCubit.changeRefresh(false);
          return true;
        }
        return previous != current;
      },
      bloc: tftChampionCubit,
      builder: (context, TftChampionState state) {
        if (state.status == Status.loading) {
          return Center(
            child: CustomLoadingWidget(),
          );
        } else if (state.status == Status.loaded) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.tftChampionModelList.length,
            itemBuilder: (context, index) {
              return TftChampionItem(item: state.tftChampionModelList[index]);
            },
          );
        } else {
          return const Center(
            child: Text('Hata 404'),
          );
        }
      },
    );
  }
}
