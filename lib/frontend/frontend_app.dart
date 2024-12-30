import 'package:arfoon_note/theme/dark_theme.dart';
import 'package:arfoon_note/theme/light_theme.dart';
import 'package:arfoon_note/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

class FrontendApp extends StatelessWidget {
  const FrontendApp({super.key, required this.home});
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, child) {
          final provider = Provider.of<ThemeProvider>(context);
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
