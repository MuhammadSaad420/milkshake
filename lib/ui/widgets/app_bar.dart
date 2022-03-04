import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

class AppBarWidget extends StatelessWidget {
  final String? backTitle;
  final String? mainTitle;
  final String? endTitle;
  const AppBarWidget(
      {Key? key, this.backTitle, this.mainTitle, this.endTitle = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: SizedBox(
        height: AppSize.s56,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios),
                  TextWidget(title: backTitle!, textColor: AppColors.primary)
                ],
              ),
            ),
            TextWidget(title: mainTitle!, textColor: AppColors.black),
            (endTitle != '')
                ? TextWidget(title: endTitle!, textColor: AppColors.primary)
                : SizedBox(
                    width: 40,
                  )
          ],
        ),
      ),
    );
  }
}
