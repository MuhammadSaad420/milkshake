import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/screens/welcome_screen.dart';

class Routes {
  static const String welcomeRoute = '/';
  static const String signupRoute = '/signup';
  static const String loginRoute = '/login';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
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
