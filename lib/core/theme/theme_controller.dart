import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController instance = ThemeController();

  ThemeMode themeMode = ThemeMode.system;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
