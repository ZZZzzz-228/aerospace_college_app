import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;
  bool get isAuth => _isAuth;

  void login() {
    _isAuth = true;
    notifyListeners();
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}