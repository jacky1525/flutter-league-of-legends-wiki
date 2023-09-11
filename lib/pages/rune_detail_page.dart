import 'package:flutter/material.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/pages/rune_extra_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RuneDetailPage extends StatefulWidget {
  final RuneModel rune;
  var imgPath;
  final index;
  RuneDetailPage(
      {super.key, this.imgPath, required this.rune, required this.index});

  @override
  State<RuneDetailPage> createState() => _RuneDetailPageState();
}

class _RuneDetailPageState extends State<RuneDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.imgPath),
              fit: ScreenUtil().orientation == Orientation.portrait
                  ? BoxFit.fill
                  : BoxFit.fitHeight),
        ),
        child: Padding(
          padding: ScreenUtil().orientation == Orientation.portrait
              ? const EdgeInsets.only(left: 75,right: 75,top: 150)
              : const EdgeInsets.only(left: 350, right: 350,top: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RuneDetailPage(
                                rune: widget.rune,
                                index: widget.index,
                                imgPath: widget.imgPath,
                              )));
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://ddragon.canisback.com/img/${widget.rune.icon}",
                            scale: 0.7),
                        fit: BoxFit.none),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    border: Border.all(color: Colors.lime, width: 2),
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        widget.rune.slots[0].runes.length == 3 ? 3 : 4),
                itemCount: widget.rune.slots[0].runes.length,
                scrollDirection: Axis.vertical,
                reverse: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RuneExtraDetailPage(
                            rune: widget.rune,
                            index: index,
                            num: 0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://ddragon.canisback.com/img/${widget.rune.slots[0].runes[index].icon}"),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(color: Colors.lime, width: 2),
                      ),
                    ),
                  );
                },
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        widget.rune.slots[1].runes.length == 3 ? 3 : 4),
                itemCount: widget.rune.slots[1].runes.length,
                scrollDirection: Axis.vertical,
                reverse: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RuneExtraDetailPage(
                            rune: widget.rune,
                            index: index,
                            num: 1,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://ddragon.canisback.com/img/${widget.rune.slots[1].runes[index].icon}"),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(color: Colors.lime, width: 2),
                      ),
                    ),
                  );
                },
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        widget.rune.slots[2].runes.length == 3 ? 3 : 4),
                itemCount: widget.rune.slots[2].runes.length,
                scrollDirection: Axis.vertical,
                reverse: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RuneExtraDetailPage(
                            rune: widget.rune,
                            index: index,
                            num: 2,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://ddragon.canisback.com/img/${widget.rune.slots[2].runes[index].icon}"),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(color: Colors.lime, width: 2),
                      ),
                    ),
                  );
                },
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        widget.rune.slots[3].runes.length == 3 ? 3 : 4),
                itemCount: widget.rune.slots[3].runes.length,
                scrollDirection: Axis.vertical,
                reverse: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RuneExtraDetailPage(
                            rune: widget.rune,
                            index: index,
                            num: 3,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://ddragon.canisback.com/img/${widget.rune.slots[3].runes[index].icon}"),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(color: Colors.lime, width: 2),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
