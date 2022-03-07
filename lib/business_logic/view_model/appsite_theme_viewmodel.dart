import 'package:flutter/cupertino.dart';

class AppSiteThemeViewModel extends ChangeNotifier {
  bool _lightTileChecked = true;
  bool _darkTileChecked = false;

  bool get lightTileChecked => _lightTileChecked;
  bool get darkTileChecked => _darkTileChecked;

  void onLightTileClicked() {
    _lightTileChecked = true;
    _darkTileChecked = false;
    notifyListeners();
  }

  void onDarkTileClicked() {
    _darkTileChecked = true;
    _lightTileChecked = false;
    notifyListeners();
  }
}
