import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/text_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s97,
      color: AppColors.appBarColor,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s14),
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s40,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s17,
                    ),
                    TextWidget(
                      title: "West Bridge",
                      textColor: AppColors.black,
                      customFont: "New Rocker",
                      fontSize: FontSize.s24,
                    )
                  ],
                ),
                Icon(
                  Icons.menu,
                  color: AppColors.black,
                  size: AppSize.s36,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
