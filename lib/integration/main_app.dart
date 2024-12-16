import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/integration/pages/home_page.dart';
import 'package:flutter/widgets.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const FrontendApp(home: HomePage());
  }
}
