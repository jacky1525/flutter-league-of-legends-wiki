import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json/cubit/item/item_cubit.dart';
import 'package:flutter_json/cubit/perk/perk_cubit.dart';
import 'package:flutter_json/cubit/spell/spell_cubit.dart';
import 'package:flutter_json/cubit/summoner/summoner_cubit.dart';
import 'package:flutter_json/pages/home_page.dart';
import 'package:flutter_json/pages/select_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'cubit/main/cubit_cubit.dart';
import 'cubit/tft/tft_champion_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitCubit>(
          create: (context) => CubitCubit(),
        ),
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),
        BlocProvider<TftChampionCubit>(
          create: (context) => TftChampionCubit(),
        ),
        BlocProvider<SummonerCubit>(
          create: (context) => SummonerCubit(),
        ),
        BlocProvider<SpellCubit>(
          create: (context) => SpellCubit(),
        ),
        BlocProvider<PerkCubit>(
          create: (context) => PerkCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(412, 732),
        builder: (context, child) => MaterialApp(
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          debugShowCheckedModeBanner: false,
          title: 'League of Legends',
          theme: ThemeData.dark().copyWith(),
          home: const SelectPage(),
        ),
      ),
    );
  }
}
