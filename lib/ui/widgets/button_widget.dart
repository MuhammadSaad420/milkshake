import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool withIcon;
  final String iconImage;
  final String buttonTitle;
  final bool isFilled;
  final VoidCallback? onBtnPressed;
  const ButtonWidget({
    Key? key,
    this.height = AppSize.s50,
    this.width = AppSize.s350,
    this.withIcon = false,
    this.iconImage = '',
    required this.buttonTitle,
    this.isFilled = true,
    required this.onBtnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBtnPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isFilled ? AppColors.primary : null,
          border: Border.all(color: AppColors.primary, width: AppSize.s2),
          borderRadius: BorderRadius.circular(AppSize.s100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (withIcon) Image.asset(iconImage),
            if (withIcon) const SizedBox(width: AppSize.s10),
            TextWidget(
              title: buttonTitle,
              textColor: isFilled
                  ? AppColors.white
                  : CupertinoTheme.of(context).textTheme.textStyle.color!,
            ),
          ],
        ),
      ),
    );
  }
}
