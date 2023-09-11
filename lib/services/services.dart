import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/model/tag_model.dart';
import 'package:flutter_json/widgets/item_list.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../model/champions_model.dart';

class Services {
  searchChampions(List<ChampionsModel> list, String value) {
    List<ChampionsModel> searchList = list
        .where((champion) =>
            champion.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    return searchList;
  }

  searchItems(List<ItemModel> list, String value) {
    List<ItemModel> searchList = list
        .where((item) => item.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    return searchList;
  }

  filteredItems(List<ItemModel> list, List<String> tags, bool value,
      List<ItemModel> initialList, List<String> selectedTags) {
    List<ItemModel> itemsList = [];

    if (selectedTags.isNotEmpty) {
      print(selectedTags);
      for (ItemModel item in initialList) {
        bool itemsControl = selectedTags.every((element) {
          return item.tags.contains(element);
        });
        if (itemsControl) {
          itemsList.add(item);
        }
      }

      print(selectedTags);

      return itemsList;
    } else {
      return initialList;
    }
  }
}

void sumNotFound(BuildContext context) {
  SmartDialog.show(
    builder: (_) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      return Container(
        height: height * 0.1,
        width: width * 0.75,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.lime, width: 2),
        ),
        alignment: Alignment.center,
        child: const Text('Summoner not found.',
            style: TextStyle(color: Colors.white)),
      );
    },
  );
}

void showScreen(BuildContext context, ItemCubit itemCubit) async {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  SmartDialog.show(builder: (_) {
    return BlocBuilder<ItemCubit, ItemState>(
      buildWhen: (previous, current) {
        if (current.needRefresh) {
          itemCubit.changeRefresh(false);
          return true;
        }
        return previous != current;
      },
      bloc: itemCubit,
      builder: (context, state) {
        return Container(
          height: height * 0.8,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        itemCubit.getInitialTagList(needRefresh: true);
                      },
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 2, color: Colors.lime)),
                      child: const Text(
                        "Clear filters",
                        style: TextStyle(fontSize: 18, color: Colors.lime),
                      )),
                  TextButton(
                      onPressed: () {
                        SmartDialog.dismiss();
                      },
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 2, color: Colors.lime)),
                      child: const Text(
                        "Done",
                        style: TextStyle(fontSize: 18, color: Colors.lime),
                      ))
                ],
              ),
              SizedBox(
                width: width * 0.8,
                height: height * 0.7,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: state.tagList.length,
                  itemBuilder: (context, index) {
                    var item = state.tagList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.tag,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Transform.scale(
                            scale: 1.25,
                            child: Checkbox(
                              fillColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              checkColor: Colors.lime,
                              side: const BorderSide(
                                  color: Colors.lime, width: 2),
                              value: item.isCheck,
                              onChanged: (value) {
                                itemCubit.setCheck(value!, index,
                                    needRefresh: true);
                                value = item.isCheck;
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  });
}
