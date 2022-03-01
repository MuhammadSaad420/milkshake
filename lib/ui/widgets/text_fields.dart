import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class SimpleFormField extends StatelessWidget {
  final String hintText;
  const SimpleFormField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hint,
          fontWeight: FontWeight.w400,
          fontSize: FontSize.s17,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
