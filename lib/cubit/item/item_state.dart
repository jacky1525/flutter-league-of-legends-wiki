part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  List<ItemModel> itemList;
  List<ItemModel> initialItemList;
  List<ItemModel> searchItemList;
  List<TagModel> tagList;
  List<String> selectedTags;
  final Status status;
  final bool showButton;
  final bool isCheck;
  final bool needRefresh;

  ItemState(
      {required this.itemList,
      required this.status,
      required this.showButton,
      required this.searchItemList,
      required this.isCheck,
      required this.tagList,
      required this.needRefresh,
      required this.initialItemList,
      required this.selectedTags});

  ItemState copyWith({
    List<ItemModel>? itemList,
    List<ItemModel>? initialItemList,
    Status? status,
    bool? showButton,
    List<ItemModel>? searchItemList,
    bool? isCheck,
    List<TagModel>? tagList,
    bool? needRefresh,
    List<String>? selectedTags,
  }) {
    return ItemInitial(
        itemList: itemList ?? this.itemList,
        status: status ?? this.status,
        showButton: showButton ?? this.showButton,
        searchItemList: searchItemList ?? this.searchItemList,
        isCheck: isCheck ?? this.isCheck,
        tagList: tagList ?? this.tagList,
        needRefresh: needRefresh ?? this.needRefresh,
        initialItemList: initialItemList ?? this.initialItemList,
        selectedTags: selectedTags ?? this.selectedTags);
  }

  @override
  List<Object> get props => [
        itemList,
        status,
        showButton,
        searchItemList,
        isCheck,
        tagList,
        needRefresh,
        initialItemList,
        selectedTags
      ];
}

class ItemInitial extends ItemState {
  ItemInitial({
    required List<ItemModel> itemList,
    required Status status,
    required bool showButton,
    required List<ItemModel> searchItemList,
    required bool isCheck,
    required List<TagModel> tagList,
    required bool needRefresh,
    required List<ItemModel> initialItemList,
    required List<String> selectedTags,
  }) : super(
            itemList: itemList,
            status: status,
            showButton: showButton,
            searchItemList: searchItemList,
            isCheck: isCheck,
            tagList: tagList,
            needRefresh: needRefresh,
            initialItemList: initialItemList,
            selectedTags: selectedTags);
}
