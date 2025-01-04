import 'dart:developer';

import 'package:arfoon_note/theme/dark_theme.dart';
import 'package:arfoon_note/theme/light_theme.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark, system }

class ThemeProvider with ChangeNotifier {
  final ThemeData _theme = ThemeData.light();
  String currentSelectedLabel = 'All Notes';

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
    }
    if (currentTheme == AppTheme.system) {
      themeMode = ThemeMode.system;
      currentTheme = AppTheme.system;
    }
    notifyListeners();
  }

  void selectCurrentLabel(currentLabel) {
    log('selected Label = $currentLabel');
    currentSelectedLabel = currentLabel;
    notifyListeners();
  }
}
