import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class SimpleFormField extends StatelessWidget {
  final String hintText;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String? Function(String?)? onValidateHandler;
  final bool isVisible;

  final Function(String?)? onSavedHandler;

  const SimpleFormField({
    Key? key,
    required this.hintText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.onValidateHandler,
    this.onSavedHandler,
    this.isVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      cursorHeight: AppSize.s20,
      obscureText: !isVisible,
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: onValidateHandler,
      onSaved: onSavedHandler,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppPadding.p19, vertical: AppPadding.p16),
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
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}

class FormFieldWithIcon extends StatelessWidget {
  final String hintText;
  final String iconImage;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String? Function(String?)? onValidateHandler;
  final bool isVisible;
  final VoidCallback? iconPressed;
  final TextEditingController nameFieldController;

  final Function(String?)? onSavedHandler;
  final Function(String?)? onTextEntered;

  const FormFieldWithIcon({
    Key? key,
    required this.hintText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.onValidateHandler,
    this.onSavedHandler,
    this.isVisible = true,
    required this.onTextEntered,
    required this.iconImage,
    this.iconPressed,
    required this.nameFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameFieldController,
      cursorColor: AppColors.primary,
      cursorHeight: AppSize.s20,
      obscureText: !isVisible,
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: onValidateHandler,
      onSaved: onSavedHandler,
      onChanged: onTextEntered,
      decoration: InputDecoration(
        suffix:
            GestureDetector(onTap: iconPressed, child: Image.asset(iconImage)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p19, vertical: AppPadding.p16),
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
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}

class UrlFormFieldWithIcon extends StatelessWidget {
  final String hintText;
  final String iconImage;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String? Function(String?)? onValidateHandler;
  final bool isVisible;
  final VoidCallback? iconPressed;
  final TextEditingController nameFieldController;

  final Function(String?)? onSavedHandler;
  final Function(String?)? onTextEntered;

  const UrlFormFieldWithIcon({
    Key? key,
    required this.hintText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.onValidateHandler,
    this.onSavedHandler,
    this.isVisible = true,
    required this.onTextEntered,
    required this.iconImage,
    this.iconPressed,
    required this.nameFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameFieldController,
      cursorColor: AppColors.primary,
      cursorHeight: AppSize.s20,
      obscureText: !isVisible,
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: onValidateHandler,
      onSaved: onSavedHandler,
      onChanged: onTextEntered,
      decoration: InputDecoration(
        suffix:
            GestureDetector(onTap: iconPressed, child: Image.asset(iconImage)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p19, vertical: AppPadding.p16),
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
            borderSide: BorderSide(color: AppColors.grey5, width: 1)),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}
