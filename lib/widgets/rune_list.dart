import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/cubit/perk/perk_cubit.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_json/widgets/rune_item.dart';

class RuneList extends StatefulWidget {
  const RuneList({
    super.key,
  });

  @override
  State<RuneList> createState() => _RuneListState();
}

class _RuneListState extends State<RuneList> {
  late PerkCubit perkCubit;
  LolApi dioClient = LolApi();

  @override
  void initState() {
    super.initState();
    perkCubit = BlocProvider.of<PerkCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    //var index;
    return BlocBuilder<PerkCubit, PerkState>(
      bloc: perkCubit,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return CustomLoadingWidget();
        } else if (state.status == Status.loaded) {
          return ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: Colors.lime,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.perkList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          RuneItem(
                        rune: state.perkList[index],
                        index: index,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
