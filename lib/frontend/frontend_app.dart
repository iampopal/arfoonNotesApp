import 'package:arfoon_note/frontend/providers/notes_provider.dart';
import 'package:arfoon_note/theme/dark_theme.dart';
import 'package:arfoon_note/theme/light_theme.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

class FrontendApp extends StatelessWidget {
  const FrontendApp(
      {super.key, required this.home, required this.currentTheme});
  final Widget home;
  final String currentTheme;

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => NotesProvider())
        ],
        builder: (context, child) {
          final provider = Provider.of<ThemeProvider>(context);
          // if (currentTheme == 'Light') {
          //   provider.currentTheme = AppTheme.light;
          // } else {
          //   provider.currentTheme = AppTheme.dark;
          // }
          return MaterialApp(
            localizationsDelegates: Locales.delegates,
            supportedLocales: Locales.supportedLocales,
            locale: locale,
            debugShowCheckedModeBanner: false,
            title: 'Arfoon Note',
            // theme: provider.theme,
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: Colors.white,
              colorScheme: lightColorScheme,
            ), //provider.lightColor),
            darkTheme: ThemeData(
              useMaterial3: false,
              primaryColor: Colors.black,
              colorScheme: darkColorScheme,
            ),
            themeMode: provider.themeMode,
            // ThemeData(
            //   colorScheme: ColorScheme.fromSeed(
            //       seedColor: Colors.black, primary: Colors.white),
            //   useMaterial3: false,
            // ),
            home: home,
          );
        },
      ),
    );
  }
}
