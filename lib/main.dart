import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/integration/main_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences themeMode = await SharedPreferences.getInstance();
  String? selectedTheme = themeMode.getString('theme');
  await Locales.init(['en', 'ps', 'fa']);
  if (kReleaseMode) {
    runApp(
      FrontendApp(
        currentTheme: selectedTheme ?? 'Light',
        home: const MainApp(),
      ),
    );
    return;
  }
  runApp(
    FrontendApp(
      currentTheme: selectedTheme ?? 'Light',
      home: const ExamplePage(),
    ),
  );
}
