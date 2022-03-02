import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/button_widget.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

import '../widgets/text_fields.dart';

class BrandNameScreen extends StatefulWidget {
  const BrandNameScreen({Key? key}) : super(key: key);

  @override
  State<BrandNameScreen> createState() => _BrandNameScreenState();
}

class _BrandNameScreenState extends State<BrandNameScreen> {
  bool isNameGreat = false;
  TextEditingController _nameFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppPadding.p20,
            AppPadding.p74,
            AppPadding.p20,
            AppPadding.p64,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const TextWidget(
                      title: AppStrings.brandNameHeading,
                      textColor: AppColors.black,
                      fontSize: FontSize.s24,
                      fontWeight: FontWeightManager.bold,
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    const TextWidget(
                      title: AppStrings.brandNameSubHeading,
                      textColor: AppColors.grey1,
                      fontWeight: FontWeightManager.normal,
                      alignemt: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppSize.s46,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        title: AppStrings.brandNameFieldTitle,
                        textColor: AppColors.grey1,
                        fontWeight: FontWeightManager.semiBold,
                        fontSize: FontSize.s11,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s6,
                    ),
                    FormFieldWithIcon(
                      nameFieldController: _nameFieldController,
                      iconPressed: () {
                        if (!isNameGreat) {
                          _nameFieldController.clear();
                        }
                      },
                      iconImage: isNameGreat
                          ? ImageAssets.tickIc
                          : ImageAssets.crossIc,
                      hintText: AppStrings.brandNameHint,
                      inputType: TextInputType.emailAddress,
                      onValidateHandler: (value) {
                        if (value!.isEmpty) return AppStrings.emptyFieldError;
                      },
                      onSavedHandler: (value) {},
                      onTextEntered: (value) {
                        if (value!.length >= 9) {
                          setState(() {
                            isNameGreat = true;
                          });
                        } else {
                          setState(() {
                            isNameGreat = false;
                          });
                        }
                      },
                    ),
                    if (isNameGreat)
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p19,
                            vertical: AppPadding.p5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            title: AppStrings.greatName,
                            textColor: AppColors.green,
                            fontSize: FontSize.s11,
                          ),
                        ),
                      ),
                  ],
                ),
                ButtonWidget(
                    buttonTitle: AppStrings.continueTitle,
                    onBtnPressed: () {
                      //if (_formKey.currentState!.validate()) {}
                      if (isNameGreat) {
                        Navigator.pushNamed(context, Routes.fontsRoute);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
