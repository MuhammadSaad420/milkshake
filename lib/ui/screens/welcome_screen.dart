import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/screens/login_signup_screen.dart';

import '../widgets/button_widget.dart';
import '../widgets/rich_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppSize.s10),
        child: Column(
          children: [
            Image.asset(ImageAssets.welcomeImage),
            Image.asset(ImageAssets.mycropageImage),
            const SizedBox(
              height: AppSize.s45,
            ),
            ButtonWidget(
              buttonTitle: AppStrings.signUpWithGoogle,
              withIcon: true,
              isFilled: false,
              iconImage: ImageAssets.googleIc,
              onBtnPressed: () {},
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ButtonWidget(
              buttonTitle: AppStrings.signUpWithApple,
              withIcon: true,
              isFilled: false,
              iconImage: ImageAssets.appleIc,
              onBtnPressed: () {},
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ButtonWidget(
                buttonTitle: AppStrings.signUpWithEmail,
                onBtnPressed: () {
                  Navigator.pushNamed(context, Routes.loginSignUpRoute,
                      arguments: false);
                }),
            const SizedBox(
              height: AppSize.s10,
            ),
            const AlreadyHaveAnAccountWidget()
          ],
        ),
      ),
    );
  }
}
