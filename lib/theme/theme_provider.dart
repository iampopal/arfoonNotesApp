import 'package:arfoon_note/frontend/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData _theme = ThemeData.light();
  ThemeData get theme => _theme;
  final ColorScheme lightColor = lightColorScheme;
  final ColorScheme darkColor = darkColorScheme;
  ThemeMode themeMode = ThemeMode.light;
  void toggleTheme(ThemeData theme) {
    final isDark = _theme == theme;
    if (isDark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
