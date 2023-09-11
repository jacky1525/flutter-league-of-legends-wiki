import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/pages/items_detail_page.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/widgets/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';

import '../constants/constants.dart';

class SearchItemPageV2 extends StatefulWidget {
  final ItemCubit itemCubit;
  final ItemModel? item;
  const SearchItemPageV2({super.key, this.item, required this.itemCubit});

  @override
  State<SearchItemPageV2> createState() => _SearchItemPageV2State();
}

class _SearchItemPageV2State extends State<SearchItemPageV2> {
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
        widget.itemCubit.showButton(true);
        showButton = widget.itemCubit.state.showButton;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        widget.itemCubit.showButton(false);
        showButton = widget.itemCubit.state.showButton;
      } else {
        widget.itemCubit.showButton(false);
        showButton = widget.itemCubit.state.showButton;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.itemCubit.getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<ItemCubit, ItemState>(
        bloc: widget.itemCubit,
        builder: (context, state) {
          if (state.status == Status.loading) {
            return Center(
              child: CustomLoadingWidget(),
            );
          } else if (state.status == Status.loaded) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: state.searchItemList.length + 1,
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

  Widget _goTopButton() {
    return BlocBuilder<ItemCubit, ItemState>(
      bloc: widget.itemCubit,
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
    return BlocBuilder<ItemCubit, ItemState>(
      bloc: widget.itemCubit,
      builder: (context, state) {
        return Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Center(
              child: TextField(
                onChanged: (text) {
                  text = text.toLowerCase();
                  widget.itemCubit.searchItem(state.itemList, text);
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
                    hintText: "Item name",
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
    var itemImage =
        'http://ddragon.leagueoflegends.com/cdn/13.17.1/img/item/${widget.itemCubit.state.searchItemList[index].image.full}';

    return BlocBuilder<ItemCubit, ItemState>(
      bloc: widget.itemCubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(
                              item: state.searchItemList[index],
                              itemCubit: widget.itemCubit),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lime, width: 2),
                        image: DecorationImage(
                            image: NetworkImage(itemImage), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          parse(state.searchItemList[index].name).body!.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Divider(
                  height: 20,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.lime,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
