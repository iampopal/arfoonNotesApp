import 'package:arfoon_note/frontend/theme/dark_theme.dart';
import 'package:arfoon_note/frontend/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class FrontendApp extends StatelessWidget {
  const FrontendApp({super.key, required this.home});
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        title: 'Arfoon Note',
        theme: lightTheme,
        darkTheme: darkTheme,
        // ThemeData(
        //   colorScheme: ColorScheme.fromSeed(
        //       seedColor: Colors.black, primary: Colors.white),
        //   useMaterial3: false,
        // ),
        home: home,
      ),
    );
  }
}
