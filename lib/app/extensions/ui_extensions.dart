import 'package:milkshake_practise/app/constant.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';

extension PasswordValidation on String {
  get isPasswordValid {
    if (this.isEmpty) {
      return AppStrings.emptyFieldError;
    } else if (this.length < 8) {
      return AppStrings.passwordLengthError;
    }
  }
}

extension EmailValidation on String {
  get isEmailValid {
    if (this.isEmpty) {
      return AppStrings.emptyFieldError;
    } else if (!RegExp(Constant.EMAIL_PATTERN).hasMatch(this.trim())) {
      return AppStrings.invalidEmailError;
    }
  }
}
