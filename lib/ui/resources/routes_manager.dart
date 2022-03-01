import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/screens/welcome_screen.dart';

import '../screens/login_signup_screen.dart';

class Routes {
  static const String welcomeRoute = '/';
  static const String loginSignUpRoute = '/loginSignUp';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case Routes.loginSignUpRoute:
      return MaterialPageRoute(builder: (_) => LoginSignUpScreen(login: settings.arguments as bool,),);
      default:
        return undefinedRoute();
    }
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Container(
          child: const Text(AppStrings.noDefinedRoute),
        ),
      ),
    );
  }
}
