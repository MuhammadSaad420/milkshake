import 'package:flutter/cupertino.dart';

class UrlScreenViewModel extends ChangeNotifier {
  bool _isUrlGreat = false;
  bool _isUrlTaken = false;
  bool _isSomethingEntered = false;
  bool get isUrlGreat => _isUrlGreat;
  bool get isUrlTaken => _isUrlTaken;
  bool get isSomethingEntered => _isSomethingEntered;
  void setUrlGreat(bool value) {
    _isUrlGreat = value;
    notifyListeners();
  }

  void setUrlTaken(bool value) {
    _isUrlTaken = value;
    notifyListeners();
  }

  void setSomethingEntered(bool value) {
    _isSomethingEntered = value;
    notifyListeners();
  }
}
