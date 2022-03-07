import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/text_widget.dart';

class CheckTileWidget extends StatelessWidget {
  final Color cardColor;
  final Color textColor;
  final Color buttonColor;

  const CheckTileWidget({
    Key? key,
    required this.cardColor,
    required this.textColor,
    this.buttonColor = AppColors.grey2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s7),
            child: Container(
              height: AppSize.s36,
              width: AppSize.s36,
              color: AppColors.black,
            ),
          ),
          title: TextWidget(
              title: "West Bridge",
              customFont: "New Rocker",
              textColor: textColor),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s100),
            child: Container(
              height: AppSize.s22,
              width: AppSize.s74,
              color: buttonColor,
              child: Center(
                child: TextWidget(
                  title: AppStrings.button,
                  textColor: textColor,
                  fontSize: FontSize.s11,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
