import 'package:arfoon_note/theme/dark_theme.dart';
import 'package:arfoon_note/theme/light_theme.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class ThemeProvider with ChangeNotifier {
  final ThemeData _theme = ThemeData.light();

  ThemeData get theme => _theme;

  final ColorScheme lightColor = lightColorScheme;
  final ColorScheme darkColor = darkColorScheme;

  ThemeMode themeMode = ThemeMode.system;
  AppTheme currentTheme = AppTheme.light;

  void toggleTheme(ThemeData theme) {
    final isDark = _theme == theme;
    if (isDark) {
      themeMode = ThemeMode.light;
      currentTheme = AppTheme.light;
    } else if (isDark == false) {
      themeMode = ThemeMode.dark;
      currentTheme = AppTheme.dark;
    } else {
      themeMode = ThemeMode.system;
    }
    notifyListeners();
  }
}
