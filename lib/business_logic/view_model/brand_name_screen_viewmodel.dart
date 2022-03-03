import 'package:flutter/cupertino.dart';

class BrandNameScreenViewModel extends ChangeNotifier {
  bool _isNameGreat = false;
  bool get isNameGreat => _isNameGreat;
  void setNameGreat(bool value) {
    _isNameGreat = value;
    notifyListeners();
  }
}
