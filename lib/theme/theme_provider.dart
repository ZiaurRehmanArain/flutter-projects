import 'package:flutter/material.dart';
import 'package:noteapp/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  
  bool get isDartMode => _themeData == darkMode;

  set setTheme(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleThemen() {
    if (_themeData == lightMode) {
      setTheme = darkMode;
    } else {
      setTheme = lightMode;
    }
    notifyListeners();
  }
}
