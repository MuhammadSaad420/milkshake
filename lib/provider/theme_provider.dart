import 'package:flutter/cupertino.dart';
import 'package:milkshake_practise/app/prefs/theme_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _isDark;
  late ThemePreference _themePreference;
  bool get isDark => _isDark;
  ThemeProvider() {
    _isDark = false;
    _themePreference = ThemePreference();
    getPreferences();
  }
  set isDark(bool value) {
    _isDark = value;
    _themePreference.setTheme(value);
    notifyListeners();
  }

  Future<void> getPreferences() async {
    _isDark = (await _themePreference.getTheme())!;
    notifyListeners();
  }
}
