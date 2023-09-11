import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/cubit/summoner/summoner_cubit.dart';

class PopUpMenu extends StatelessWidget {
  final SummonerCubit summonerCubit;
  const PopUpMenu({super.key, required this.summonerCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummonerCubit, SummonerState>(
      builder: (context, state) {
        return PopupMenuButton(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lime, width: 2),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  state.location.toUpperCase(),
                  style: TextStyle(fontSize: 18),
                ),
              )),
          onSelected: (value) {
            if (value == "na") {
              summonerCubit.setLocation(value);
            } else if (value == "br") {
              summonerCubit.setLocation(value);
            } else if (value == "euw") {
              summonerCubit.setLocation(value);
            } else if (value == "eune") {
              summonerCubit.setLocation(value);
            } else if (value == "jp") {
              summonerCubit.setLocation(value);
            } else if (value == "kr") {
              summonerCubit.setLocation(value);
            } else if (value == "lan") {
              summonerCubit.setLocation(value);
            } else if (value == "las") {
              summonerCubit.setLocation(value);
            } else if (value == "oce") {
              summonerCubit.setLocation(value);
            } else if (value == "tr") {
              summonerCubit.setLocation(value);
            } else if (value == "ru") {
              summonerCubit.setLocation(value);
            } else if (value == "ph") {
              summonerCubit.setLocation(value);
            } else if (value == "sg") {
              summonerCubit.setLocation(value);
            } else if (value == "th") {
              summonerCubit.setLocation(value);
            } else if (value == "tw") {
              summonerCubit.setLocation(value);
            } else if (value == "vn") {
              summonerCubit.setLocation(value);
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: "na",
                child: Text("NA"),
              ),
              PopupMenuItem(
                value: "br",
                child: Text("BR"),
              ),
              PopupMenuItem(
                value: "euw",
                child: Text("EUW"),
              ),
              PopupMenuItem(
                value: "eune",
                child: Text("EUNE"),
              ),
              PopupMenuItem(
                value: "jp",
                child: Text("JP"),
              ),
              PopupMenuItem(
                value: "kr",
                child: Text("KR"),
              ),
              PopupMenuItem(
                value: "lan",
                child: Text("LAN"),
              ),
              PopupMenuItem(
                value: "las",
                child: Text("LAS"),
              ),
              PopupMenuItem(
                value: "oce",
                child: Text("OCE"),
              ),
              PopupMenuItem(
                value: "tr",
                child: Text("TR"),
              ),
              PopupMenuItem(
                value: "ru",
                child: Text("RU"),
              ),
              PopupMenuItem(
                value: "ph",
                child: Text("PH"),
              ),
              PopupMenuItem(
                value: "sg",
                child: Text("SG"),
              ),
              PopupMenuItem(
                value: "th",
                child: Text("TH"),
              ),
              PopupMenuItem(
                value: "tw",
                child: Text("TW"),
              ),
              PopupMenuItem(
                value: "vn",
                child: Text("VN"),
              ),
            ];
          },
        );
      },
    );
  }
}
