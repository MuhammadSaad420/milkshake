import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/text_widget.dart';

class AddFirstWidget extends StatelessWidget {
  const AddFirstWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s108,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Column(children: [
          SizedBox(
            height: AppSize.s35,
          ),
          Icon(
            Icons.add_circle,
            color: AppColors.primary,
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          TextWidget(
            title: AppStrings.addYourFirst,
            textColor: AppColors.black,
            fontSize: FontSize.s13,
          )
        ]),
      ),
    );
  }
}
