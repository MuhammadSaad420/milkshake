import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final TextAlign alignemt;
  final FontWeight fontWeight;
  final double fontSize;
  final String? customFont;

  const TextWidget({
    Key? key,
    required this.title,
    required this.textColor,
    this.alignemt = TextAlign.left,
    this.fontWeight = FontWeightManager.normal,
    this.fontSize = FontSize.s17,
    this.customFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: customFont == null
          ? TextStyle(
              fontFamily: "San",
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            )
          : GoogleFonts.getFont(
              customFont!,
              textStyle: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ),
      textAlign: alignemt,
    );
  }
}
