import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double appTitleWH() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static double appTitleRuneWH() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.10.sh : 0.10.sw;
  }

  static double iconWH() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw;
  }

  static final Map<String, Color> _typeColorMap = {
    'Fighter': Colors.yellow,
    'Mage': Colors.blue.shade600,
    'Tank': Colors.blue.shade900,
    'Assassin': Colors.red.shade400,
    'Marksman': Colors.green,
    'Support': Colors.blueAccent.shade100
  };

  static Color getColorFromTag(String tags) {
    if (_typeColorMap.containsKey(tags)) {
      return _typeColorMap[tags] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }
}
