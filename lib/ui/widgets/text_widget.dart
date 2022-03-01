import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final TextAlign alignemt;
  final FontWeight fontWeight;
  final double fontSize;

  const TextWidget({
    Key? key,
    required this.title,
    required this.textColor,
    this.alignemt = TextAlign.left,
    this.fontWeight = FontWeightManager.normal,
    this.fontSize = FontSize.s17,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      textAlign: alignemt,
    );
  }
}
