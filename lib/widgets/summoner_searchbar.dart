import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/cubit/summoner/summoner_cubit.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/popup_menu.dart';

import '../pages/summoner_profile.dart';

class SummonerSearchBar extends StatefulWidget {
  const SummonerSearchBar({super.key});

  @override
  State<SummonerSearchBar> createState() => _SummonerSearchBarState();
}

class _SummonerSearchBarState extends State<SummonerSearchBar> {
  LolApi dioClient = LolApi();

  late TextEditingController controller;
  late SummonerCubit summonerCubit;

  @override
  void initState() {
    super.initState();
    summonerCubit = BlocProvider.of<SummonerCubit>(context);
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.summonerSearchBarWH(0.15),
      child: Padding(
        padding: UIHelper.getDefaultPadding(hValue: 15),
        child: BlocBuilder<SummonerCubit, SummonerState>(
          bloc: summonerCubit,
          builder: (context, state) {
            return TextField(
              controller: controller,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Summoner name",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PopUpMenu(
                    summonerCubit: summonerCubit,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.lime,
                  size: 28,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.lime, width: 2),
                ),
              ),
              onSubmitted: (text) async {
                String summonerText = controller.text;
                if (summonerText.isNotEmpty) {
                  await summonerCubit.setSummonerName(summonerText);
                  print(state.summonerName);
                  await summonerCubit.getSummonerData(state.location,
                      summonerCubit.state.summonerName, context, dioClient);

                  if (summonerCubit.state.sumNameMessage == "OK") {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SummonerProfile(),
                    ));
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
