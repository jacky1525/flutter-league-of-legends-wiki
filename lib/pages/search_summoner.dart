import 'package:flutter/material.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/summoner_searchbar.dart';

class SearchSummoner extends StatefulWidget {
  const SearchSummoner({super.key});

  @override
  State<SearchSummoner> createState() => _SearchSummonerState();
}

class _SearchSummonerState extends State<SearchSummoner> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return const Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        SummonerSearchBar()
      ],
    ));
  }
}
