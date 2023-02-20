import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String championTitle = 'Şampiyonlar';
  static const String summonerTitle = 'Sihirdar Büyüleri';
  static const String runeTitle = 'Rünler';
  static const String itemTitle = 'Eşyalar';

  static TextStyle championTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle itemTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle summonerTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle runeTitleStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(42));
  }

  static TextStyle championNameStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(23));
  }

  static TextStyle championSearchNameStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(32));
  }

  static TextStyle championInfoNameStyle(color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle championTagStyle() {
    return TextStyle(color: Colors.lime, fontSize: _calculateFontSize(13));
  }

  static TextStyle championSearchTagStyle() {
    return TextStyle(
        color: Colors.lime,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20));
  }

  static double calculateIconSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.1.sw;
    } else {
      return 0.1.sh;
    }
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.6).sp;
    }
  }

  static String imagePath = 'assets/images/icon.png';
}
