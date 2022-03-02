import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';

class BrandImageScreen extends StatelessWidget {
  const BrandImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppPadding.p20,
          AppPadding.p74,
          AppPadding.p20,
          AppPadding.p64,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextWidget(
                  title: AppStrings.brandImageHeading,
                  textColor: AppColors.black,
                  fontSize: FontSize.s24,
                  fontWeight: FontWeightManager.bold,
                ),
                SizedBox(
                  height: AppSize.s8,
                ),
                TextWidget(
                  title: AppStrings.brandImageSubHeading,
                  textColor: AppColors.grey1,
                  fontWeight: FontWeightManager.normal,
                  alignemt: TextAlign.center,
                ),
                SizedBox(
                  height: AppSize.s74,
                ),
                Container(
                  width: AppSize.s126,
                  height: AppSize.s126,
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s25),
                    ),
                  ),
                  child: Image.asset(ImageAssets.placeholderImage),
                ),
                SizedBox(height: AppSize.s22),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Row(
                              children: [
                                Image.asset(ImageAssets.cameraIc),
                                SizedBox(
                                  width: AppSize.s16,
                                ),
                                Text("Use Camera")
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Row(
                              children: [
                                Image.asset(ImageAssets.graphicsIc),
                                SizedBox(
                                  width: AppSize.s16,
                                ),
                                Text("Use Camera")
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context, 'Two');
                            },
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context, 'Two');
                          },
                        ),
                      ),
                    );
                  },
                  child: TextWidget(
                    title: AppStrings.uploadImage,
                    textColor: AppColors.primary,
                    fontWeight: FontWeightManager.normal,
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ButtonWidget(
                    buttonTitle: AppStrings.continueTitle,
                    onBtnPressed: () {
                      //Navigator.pushNamed(context, Routes.brandImageRoute);
                    }),
                SizedBox(
                  height: AppSize.s14,
                ),
                TextWidget(
                  title: AppStrings.setUpLaterText,
                  textColor: AppColors.primary,
                  fontWeight: FontWeightManager.normal,
                  fontSize: FontSize.s14,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
