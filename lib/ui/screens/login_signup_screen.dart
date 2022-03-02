import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/button_widget.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';
import 'package:milkshake_practise/app/extensions/ui_extensions.dart';

import '../resources/asset_manager.dart';
import '../widgets/rich_text.dart';
import '../widgets/text_fields.dart';

class LoginSignUpScreen extends StatelessWidget {
  final bool login;
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  LoginSignUpScreen({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _validateFields() {
      bool isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
        if (login) {
        } else {
          Navigator.pushNamed(context, Routes.brandNameRoute);
        }
      } else {
        return;
      }
    }

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
                    title: login ? AppStrings.logIn : AppStrings.signUp,
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
                    title: AppStrings.yourEmail,
                    textColor: AppColors.grey1,
                    fontWeight: FontWeightManager.semiBold,
                    fontSize: FontSize.s11,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s6,
                ),
                SimpleFormField(
                  hintText: AppStrings.hintMail,
                  inputType: TextInputType.emailAddress,
                  onValidateHandler: (value) => value?.isEmailValid,
                  onSavedHandler: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: AppStrings.yourPassword,
                    textColor: AppColors.grey1,
                    fontWeight: FontWeightManager.semiBold,
                    fontSize: FontSize.s11,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s6,
                ),
                SimpleFormField(
                  isVisible: false,
                  hintText: AppStrings.passwordPlaceholder,
                  inputAction: TextInputAction.done,
                  onValidateHandler: (value) {
                    return value?.isPasswordValid;
                  },
                  onSavedHandler: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: AppStrings.forgotPassword,
                    textColor: AppColors.primary,
                    fontWeight: FontWeightManager.normal,
                    fontSize: FontSize.s17,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                ButtonWidget(
                  buttonTitle: login ? AppStrings.logIn : AppStrings.signUp,
                  onBtnPressed: _validateFields,
                ),
                const SizedBox(
                  height: AppSize.s11,
                ),
                const TextWidget(
                    title: AppStrings.or, textColor: AppColors.grey1),
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
