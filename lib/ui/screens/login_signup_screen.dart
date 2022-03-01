import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/button_widget.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

import '../resources/asset_manager.dart';
import '../widgets/rich_text.dart';
import '../widgets/text_fields.dart';

class LoginSignUpScreen extends StatelessWidget {
  final bool login;
  final _formKey = GlobalKey<FormState>();
  LoginSignUpScreen({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: AppSize.s76),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: login ? "Log In" : "Sign Up",
                    textColor: AppColors.black,
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s28,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s37,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: "YOUR EMAIL",
                    textColor: AppColors.grey1,
                    fontWeight: FontWeightManager.semiBold,
                    fontSize: FontSize.s11,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s6,
                ),
                const SimpleFormField(
                  hintText: AppStrings.hintMail,
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: "YOUR EMAIL",
                    textColor: AppColors.grey1,
                    fontWeight: FontWeightManager.semiBold,
                    fontSize: FontSize.s11,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s6,
                ),
                const SimpleFormField(
                  hintText: AppStrings.passwordPlaceholder,
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: "Forgot Password?",
                    textColor: AppColors.primary,
                    fontWeight: FontWeightManager.normal,
                    fontSize: FontSize.s17,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                ButtonWidget(
                  buttonTitle: login ? "Log In" : "Sign Up",
                  onBtnPressed: () {},
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                const TextWidget(title: "or", textColor: AppColors.grey1),
                const SizedBox(
                  height: AppSize.s11,
                ),
                ButtonWidget(
                  buttonTitle: login
                      ? AppStrings.signInWithGoogle
                      : AppStrings.signInWithApple,
                  withIcon: true,
                  isFilled: false,
                  iconImage: ImageAssets.googleIc,
                  onBtnPressed: () {},
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                ButtonWidget(
                  buttonTitle: login
                      ? AppStrings.signInWithApple
                      : AppStrings.signUpWithApple,
                  withIcon: true,
                  isFilled: false,
                  iconImage: ImageAssets.appleIc,
                  onBtnPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: !login
          ? Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AlreadyHaveAnAccountWidget(),
                ],
              ),
            )
          : null,
    );
  }
}
