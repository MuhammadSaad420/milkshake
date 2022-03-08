import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final Color textColor;
  const DescriptionText({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p19, vertical: AppPadding.p5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextWidget(
          title: text,
          textColor: textColor,
          fontSize: FontSize.s11,
        ),
      ),
    );
  }
}
