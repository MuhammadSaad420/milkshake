import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_manager.dart';

class ThemeLight {
  static CupertinoThemeData getThemeData() {
    return const CupertinoThemeData(
      scaffoldBackgroundColor: AppColors.bgLightScaffold,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(color: AppColors.black),
      ),
    );
  }
}
