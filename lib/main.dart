import 'package:flutter/material.dart';
import 'package:flutter_json/pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'League of Legends',
        theme: ThemeData.dark().copyWith(),
        home: const HomePage(),
      ),
    );
  }
}
