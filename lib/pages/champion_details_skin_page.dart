import 'package:flutter/material.dart';

class ChampionDetailsSkinPage extends StatelessWidget {
  final String img;
  const ChampionDetailsSkinPage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.download,
            color: Colors.indigo,
          ),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
