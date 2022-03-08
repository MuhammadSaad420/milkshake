import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/screens/admin_home.dart';
import 'package:milkshake_practise/ui/screens/brand%20image/brand_image_screen.dart';
import 'package:milkshake_practise/ui/screens/brand%20image/unsplash_library.dart';
import 'package:milkshake_practise/ui/screens/appsite_theme/appsite_theme.dart';
import 'package:milkshake_practise/ui/screens/fonts_screen.dart';
import 'package:milkshake_practise/ui/screens/url_screen.dart';
import 'package:milkshake_practise/ui/screens/welcome_screen.dart';

import '../screens/brand_name_screen.dart';
import '../screens/login_signup_screen.dart';

class Routes {
  static const String welcomeRoute = '/';
  static const String loginSignUpRoute = '/loginSignUp';
  static const String brandNameRoute = '/brandName';
  static const String fontsRoute = '/fonts';
  static const String brandImageRoute = '/brandImage';
  static const String brandThemeRoute = '/brandTheme';
  static const String urlRoute = '/url';
  static const String adminHomeRoute = '/adminHome';
  static const String unsplashLibraryRoute = '/unsplashLibrary';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.loginSignUpRoute:
        return MaterialPageRoute(
          builder: (_) => LoginSignUpScreen(
            login: settings.arguments as bool,
          ),
        );
      case Routes.brandNameRoute:
        return MaterialPageRoute(
          builder: (_) => BrandNameScreen(),
        );
      case Routes.fontsRoute:
        return MaterialPageRoute(
          builder: (_) => const FontScreen(),
        );
      case Routes.brandImageRoute:
        return MaterialPageRoute(
          builder: (_) =>
              BrandImageScreen(croppedData: settings.arguments as Uint8List),
        );
      case Routes.brandThemeRoute:
        return MaterialPageRoute(
          builder: (_) => BrandThemeScreen(),
        );
      case Routes.urlRoute:
        return MaterialPageRoute(
          builder: (_) => UrlScreen(),
        );
      case Routes.adminHomeRoute:
        return MaterialPageRoute(
          builder: (_) => AdminHomeScreen(),
        );
      case Routes.unsplashLibraryRoute:
        return MaterialPageRoute(
          builder: (_) => const UnsplashLibrary(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Text(AppStrings.noDefinedRoute),
      ),
    );
  }
}
