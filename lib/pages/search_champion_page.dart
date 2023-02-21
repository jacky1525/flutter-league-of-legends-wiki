import 'package:flutter/material.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/champions_search_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  final ChampionsModel? champion;

  const SearchPage({
    super.key,
    this.champion,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController scrollController = ScrollController();
  bool showButton = false;

  final List<ChampionsModel> _championsList = [];
  List<ChampionsModel> _championsDisplayList = [];

  late Future<List<ChampionsModel>> _championsListFuture;

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      double showOffset = 10.0;

      if (scrollController.offset > showOffset) {
        showButton = true;
        setState(() {});
      } else {
        showButton = false;
        setState(() {});
      }
    });

    LolApi.getChampionList().then((value) {
      setState(() {
        _championsList.addAll(value);
        _championsDisplayList = _championsList;
      });
    });
    _championsListFuture = LolApi.getChampionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FutureBuilder(
          future: _championsListFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              //List<ChampionsModel> myList = snapshot.data!; isn't used variable
              return ListView.builder(
                  controller: scrollController,
                  itemCount: _championsDisplayList.length + 1,
                  itemBuilder: (context, index) {
                    return index == 0 ? _searchBar() : _displayItem(index - 1);
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Hata 404'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
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
          size: 32,
        ),
        onPressed: () {
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
      ),
    );
  }

  Padding _searchBar() {
    return Padding(
      padding: UIHelper.getDefaultPadding(),
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Center(
          child: TextField(
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _championsDisplayList = _championsList.where((champion) {
                  var championName = champion.name.toLowerCase();
                  return championName.contains(text);
                }).toList();
              });
            },
            controller: _controller,
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            cursorColor: Colors.black87,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
                hintText: "Şampiyon adı",
                hintStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Column _displayItem(index) {
    var championSplash =
        'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${_championsDisplayList[index].id}_0.jpg';
    return Column(
      children: [
        Text(
          _championsDisplayList[index].name,
          style: Constants.championSearchNameStyle(),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChampionSearchList(
                  champion: _championsDisplayList[index],
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.w),
            ),
            elevation: 0,
            shadowColor: Colors.red,
            color: Colors.transparent,
            child: Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Container(
                height: ScreenUtil().orientation == Orientation.portrait
                    ? 200
                    : 330,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(championSplash), fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.transparent,
                    label: Text(
                      _championsDisplayList[index].title,
                      style: Constants.championSearchTagStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
          color: Colors.lime,
        )
      ],
    );
  }
}
