import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../constants/ui_helper.dart';
import '../../cubit/tft/tft_champion_cubit.dart';

class TftTitle extends StatefulWidget {
  const TftTitle({super.key});

  @override
  State<TftTitle> createState() => _TftTitleState();
}

class _TftTitleState extends State<TftTitle> {
  late TftChampionCubit tftChampionCubit;

  @override
  void initState() {
    super.initState();
    tftChampionCubit = BlocProvider.of<TftChampionCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: UIHelper.appTftChampionTitleWH(),
          child: Padding(
            padding: UIHelper.getDefaultPadding(hValue: 5, wValue: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.tftTitle,
                  style: Constants.tftTitleStyle(),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search_sharp,
                    size: 42,
                    color: Colors.lime,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<TftChampionCubit, TftChampionState>(
          bloc: tftChampionCubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.245,
                    child: TextButton(
                      onPressed: () {
                        tftChampionCubit.sortByTier(true);
                        tftChampionCubit.setColor(
                            tierColor: Colors.lime, nameColor: Colors.white);
                      },
                      child: Text(
                        "Tier",
                        style: TextStyle(fontSize: 18, color: state.tierColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      tftChampionCubit.sortByName(true);
                      tftChampionCubit.setColor(
                          tierColor: Colors.white, nameColor: Colors.lime);
                    },
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 18, color: state.nameColor),
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
