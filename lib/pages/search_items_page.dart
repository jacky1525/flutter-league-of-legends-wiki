import 'package:flutter/material.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/model/item_model.dart';
import 'package:flutter_json/pages/items_detail_page.dart';
import 'package:flutter_json/services/lol_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';

class SearchItemPage extends StatefulWidget {
  final ItemModel? item;
  const SearchItemPage({super.key, this.item});

  @override
  State<SearchItemPage> createState() => _SearchItemPageState();
}

class _SearchItemPageState extends State<SearchItemPage> {
  ScrollController scrollController = ScrollController();
  bool showButton = false;
  final _controller = TextEditingController();

  final List<ItemModel> _itemsList = [];
  List<ItemModel> _itemsDisplayList = [];

  late Future<List<ItemModel>> _itemsListFuture;

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
    LolApi.getItemList().then((value) {
      setState(() {
        _itemsList.addAll(value);
        _itemsDisplayList = _itemsList;
      });
    });

    _itemsListFuture = LolApi.getItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _itemsListFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              controller: scrollController,
              itemCount: _itemsDisplayList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? _searchBar() : _displayItem(index - 1);
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Hata : 404"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
        height: 60,
        decoration: BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Center(
          child: TextField(
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _itemsDisplayList = _itemsList.where((item) {
                  var itemName = item.name.toLowerCase();
                  return itemName.contains(text);
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
                hintText: "Eşya adı",
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

  Padding _displayItem(index) {
    var itemImage =
        'http://ddragon.leagueoflegends.com/cdn/13.10.1/img/item/${_itemsDisplayList[index].image.full}';

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
                      builder: (context) =>
                          ItemDetailPage(item: _itemsDisplayList[index]),
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
                  child: Text(parse(_itemsDisplayList[index].name).body!.text,
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
  }
}
