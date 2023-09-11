import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/model/champions_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/champions_search_list.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/main/cubit_cubit.dart';

class SearchPagev2 extends StatefulWidget {
  final CubitCubit cubit;
  final ChampionsModel? champion;

  const SearchPagev2({
    super.key,
    this.champion,
    required this.cubit,
  });

  @override
  State<SearchPagev2> createState() => _SearchPagev2State();
}

class _SearchPagev2State extends State<SearchPagev2> {
  ScrollController scrollController = ScrollController();
  bool showButton = false;

  final _controller = TextEditingController();

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
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.cubit.getChampionsModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<CubitCubit, CubitState>(
        bloc: widget.cubit,
        builder: (context, CubitState state) {
          if (state.status == Status.loading) {
            return Center(
              child: CustomLoadingWidget(),
            );
          } else if (state.status == Status.loaded) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: state.searchChampionList.length + 1,
                  itemBuilder: (context, index) {
                    return index == 0 ? _searchBar() : _displayItem(index - 1);
                  }),
            );
          } else {
            return Center(child: Text("404"));
          }
        },
      ),
      floatingActionButton: _goTopButton(),
    );
  }

  _goTopButton() {
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
              size: 32,
            ),
            onPressed: () {
              scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            },
          ),
        );
      },
    );
  }

  Widget _searchBar() {
    return BlocBuilder<CubitCubit, CubitState>(
      bloc: widget.cubit,
      builder: (context, state) {
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
                  widget.cubit.searchChampion(state.championList, text);
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
                    hintText: "Champion name",
                    hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                    border: InputBorder.none),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _displayItem(index) {
    var championSplash =
        'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.cubit.state.searchChampionList[index].id}_0.jpg';
    return BlocBuilder<CubitCubit, CubitState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state.searchChampionList[index].name,
              style: Constants.championSearchNameStyle(),
            ),
            InkWell(
              splashColor: Colors.lime,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChampionSearchList(
                      champion: state.searchChampionList[index],
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
                            image: NetworkImage(championSplash),
                            fit: BoxFit.fill)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.transparent,
                        label: Text(
                          state.searchChampionList[index].title,
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
      },
    );
  }
}
