import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';

class FontScreen extends StatelessWidget {
  const FontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppPadding.p20,
          AppPadding.p74,
          AppPadding.p20,
          AppPadding.p64,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextWidget(
                  title: AppStrings.fontNameHeading,
                  textColor: AppColors.black,
                  fontSize: FontSize.s24,
                  fontWeight: FontWeightManager.bold,
                ),
                SizedBox(
                  height: AppSize.s8,
                ),
                TextWidget(
                  title: AppStrings.fontNameSubHeading,
                  textColor: AppColors.grey1,
                  fontWeight: FontWeightManager.normal,
                  alignemt: TextAlign.center,
                ),
                SizedBox(
                  height: AppSize.s74,
                ),
                TextWidget(
                  title: "West Life",
                  textColor: AppColors.black,
                  fontWeight: FontWeightManager.normal,
                  customFont: "New Rocker",
                  fontSize: FontSize.s40,
                ),
                SizedBox(height: AppSize.s22),
                TextWidget(
                  title: AppStrings.seeOtherFont,
                  textColor: AppColors.primary,
                  fontWeight: FontWeightManager.normal,
                  fontSize: FontSize.s14,
                ),
              ],
            ),
            ButtonWidget(
                buttonTitle: AppStrings.continueTitle,
                onBtnPressed: () {
                  Navigator.pushNamed(context, Routes.brandImageRoute);
                })
          ],
        ),
      )),
    );
  }
}
