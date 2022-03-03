import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';
import 'text_widget.dart';

class ActionSheetTile extends StatelessWidget {
  final String iconImage;
  final String leadingTitle;
  final VoidCallback onSheetPressed;
  const ActionSheetTile({
    Key? key,
    required this.iconImage,
    required this.leadingTitle,
    required this.onSheetPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      child: Row(
        children: [
          Image.asset(iconImage),
          SizedBox(
            width: AppSize.s16,
          ),
          TextWidget(
            title: leadingTitle,
            textColor: AppColors.black,
            fontSize: FontSize.s20,
          )
        ],
      ),
      onPressed: onSheetPressed,
    );
  }
}
