import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_json/constants/constants.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/model/tag_model.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_json/services/services.dart';
import 'package:flutter_json/tft/widgets/tft_champion_list.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit()
      : super(ItemInitial(
            itemList: [],
            initialItemList: [],
            status: Status.initial,
            showButton: false,
            searchItemList: [],
            isCheck: false,
            tagList: tagList,
            needRefresh: false,
            selectedTags: []));

  void getItems() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final itemList = await LolApi.getItemList();
      itemList.removeWhere((item) => hiddenItems.contains(item.name));
      emit(state.copyWith(
          initialItemList: itemList,
          itemList: itemList,
          searchItemList: itemList,
          status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
      print(e);
    }
  }

  void showButton(bool value) {
    emit(state.copyWith(showButton: value));
  }

  void setCheck(bool value, int index, {required bool needRefresh}) {
    List<TagModel> newList = state.tagList;
    bool check = newList[index].isCheck;
    List<String> selectedTags = state.selectedTags;

    if (value) {
      selectedTags.add(newList[index].tag);

      check = true;
    } else {
      selectedTags.remove(newList[index].tag);

      check = false;
    }
    List<ItemModel> filteredItems = Services().filteredItems(state.itemList,
        [newList[index].tag], value, state.initialItemList, selectedTags);
    TagModel newTagModel = TagModel(tag: newList[index].tag, isCheck: check);

    newList[index] = newTagModel;

    emit(state.copyWith(
        tagList: newList,
        needRefresh: needRefresh,
        itemList: filteredItems,
        selectedTags: selectedTags));
  }

  void getInitialTagList({required bool needRefresh}) {
    List<TagModel> tagList = state.tagList;
    List<String> selectedTags = state.selectedTags;

    selectedTags.clear();

    for (var tag in tagList) {
      tag.isCheck = false;
    }

    emit(state.copyWith(
        tagList: tagList,
        needRefresh: needRefresh,
        itemList: state.initialItemList,
        selectedTags: selectedTags));
  }

  void searchItem(List<ItemModel> list, String value) {
    List<ItemModel> searchList = Services().searchItems(list, value);
    emit(state.copyWith(searchItemList: searchList));
  }

  void changeRefresh(bool value) {
    emit(state.copyWith(
      needRefresh: value,
    ));
  }
}
