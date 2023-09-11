import 'package:flutter/material.dart';
import 'package:flutter_json/pages/home_page.dart';
import 'package:flutter_json/tft/pages/tft_page.dart';
import 'package:flutter_json/widgets/loading_widget.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/lol.png"),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  TFTPage(),
            ));
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/tft.png"),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    ));
  }
}
