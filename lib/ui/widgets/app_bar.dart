import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

class AppBarWidget extends StatelessWidget {
  final AppBarType appBarType;
  final String? backTitle;
  final String? mainTitle;
  final String? endTitle;
  const AppBarWidget(
      {Key? key,
      this.backTitle,
      this.mainTitle,
      this.endTitle,
      required this.appBarType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (appBarType) {
      case AppBarType.SINGLE:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: SizedBox(
            height: AppSize.s56,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  height: AppSize.s40,
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      TextWidget(
                          title: backTitle!, textColor: AppColors.primary)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

      case AppBarType.DOUBLE:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: SizedBox(
            height: AppSize.s56,
            width: double.infinity,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: AppSize.s40,
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      TextWidget(
                          title: backTitle!, textColor: AppColors.primary)
                    ],
                  ),
                ),
                TextWidget(title: mainTitle!, textColor: AppColors.black),
                SizedBox(
                  width: 40,
                )
              ],
            ),
          ),
        );

      case AppBarType.TRIPLE:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: SizedBox(
            height: AppSize.s56,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: AppSize.s40,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primary,
                      ),
                      TextWidget(
                          title: backTitle!, textColor: AppColors.primary)
                    ],
                  ),
                ),
                TextWidget(title: mainTitle!, textColor: AppColors.black),
                TextWidget(title: endTitle!, textColor: AppColors.primary)
              ],
            ),
          ),
        );
    }
  }
}

enum AppBarType { SINGLE, DOUBLE, TRIPLE }
