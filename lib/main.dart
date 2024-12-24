import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/integration/main_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ps', 'fa']);
  if (kReleaseMode) {
    runApp(const MainApp());
    return;
  }
  runApp(const FrontendApp(home: ExamplePage()));
}
