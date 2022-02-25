import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

import '../widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(ImageAssets.welcomeImage),
              Image.asset(ImageAssets.fadedImage)
            ]),
            Image.asset(ImageAssets.mycropageImage),
            const SizedBox(
              height: AppSize.s45,
            ),
            ButtonWidget(
              buttonTitle: AppStrings.signUpWithGoogle,
              withIcon: true,
              isFilled: false,
              iconImage: ImageAssets.googleIc,
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ButtonWidget(
              buttonTitle: AppStrings.signUpWithGoogle,
              withIcon: true,
              isFilled: false,
              iconImage: ImageAssets.appleIc,
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            const ButtonWidget(buttonTitle: AppStrings.signUpWithEmail),
            const SizedBox(
              height: AppSize.s10,
            ),
            RichText(
              text: TextSpan(
                text: AppStrings.alreadyHaveAnAccount,
                style: const TextStyle(color: AppColors.primary),
                children: <TextSpan>[
                  TextSpan(
                    text: AppStrings.logIn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
