import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milkshake_practise/services/service_locator.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';
import 'package:milkshake_practise/ui/resources/theme_manager/theme_dark.dart';
import 'package:milkshake_practise/ui/resources/theme_manager/theme_light.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer(builder: (context, ThemeProvider themeProvider, child) {
          return CupertinoApp(
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Milk Shake',
            theme: themeProvider.isDark
                ? ThemeDark.getThemeData()
                : ThemeLight.getThemeData(),
            initialRoute: Routes.welcomeRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        }));
  }
}
