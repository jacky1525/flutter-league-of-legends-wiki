import 'package:flutter/material.dart';
import 'package:flutter_json/constants/ui_helper.dart';
import 'package:flutter_json/widgets/app_title_rune.dart';
import 'package:flutter_json/widgets/rune_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RunePage extends StatefulWidget {
  const RunePage({
    super.key,
  });

  @override
  State<RunePage> createState() => _RunePageState();
}

class _RunePageState extends State<RunePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppTitleRune(),
          Expanded(
            child: RuneList(),
          ),
        ],
      ),
    );
  }
}
