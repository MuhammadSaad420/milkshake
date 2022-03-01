import 'package:flutter/cupertino.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';

class ThemeDark {
  static CupertinoThemeData getThemeData() {
    return const CupertinoThemeData(
      scaffoldBackgroundColor: AppColors.black,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(color: AppColors.white),
      ),
    );
  }
}
