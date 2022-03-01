import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/string_manager.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
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
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, Routes.loginSignUpRoute,
                      arguments: true);
                })
        ],
      ),
    );
  }
}
