import 'package:flutter/material.dart';
import 'package:flutter_json/model/rune_model.dart';
import 'package:flutter_json/pages/rune_detail_page.dart';
import 'package:flutter_json/widgets/rune_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RuneItem extends StatelessWidget {
  final index;
  final RuneModel rune;
  const RuneItem({super.key, required this.rune, required this.index});

  @override
  Widget build(BuildContext context) {
    var runeImage1 = "assets/images/hakimiyet.jpg";
    var runeImage2 = "assets/images/ilham.jpg";
    var runeImage3 = "assets/images/isabet.jpg";
    var runeImage4 = "assets/images/azim.jpg";
    var runeImage5 = "assets/images/büyücülük.jpg";
    List images = [runeImage1, runeImage2, runeImage3, runeImage4, runeImage5];
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RuneDetailPage(
              imgPath: images[index], rune: rune, index: index,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: ScreenUtil().orientation == Orientation.portrait ? 350 : 200,
              height:
                  ScreenUtil().orientation == Orientation.portrait ? 450 : 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lime, width: 2),
                image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.fill),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.lime, width: 2),
              ),
              height:
                  ScreenUtil().orientation == Orientation.portrait ? 60 : 30,
              width: ScreenUtil().orientation == Orientation.portrait ? 350 : 200,
              child: Center(
                child: Text(
                  rune.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lime),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
