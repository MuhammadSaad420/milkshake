import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';

import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/text_widget.dart';

class MadeWithWidget extends StatelessWidget {
  const MadeWithWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s58,
      width: double.infinity,
      child: Card(
          color: AppColors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                title: AppStrings.madeWith,
                textColor: AppColors.white,
                fontSize: FontSize.s13,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(ImageAssets.mycropage_white)
            ],
          )),
    );
  }
}
