import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json/pages/home_page.dart';
import 'package:flutter_json/pages/select_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();
 
  ByteData data =
      await PlatformAssetBundle().load("assets/ca/lets-encrypt-r3.pem");
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
        */
  HttpOverrides.global = MyHttpOverrides();
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
        home: const SelectPage(),
      ),
    );
  }
}
