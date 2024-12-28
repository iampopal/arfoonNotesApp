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
                colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primaryContainer: Color.fromARGB(255, 236, 234, 234),
                  primary: Color.fromARGB(255, 255, 255, 255),
                  onPrimary: Color.fromARGB(255, 0, 0, 0),
                  secondary: Colors.orangeAccent,
                  onSecondary: Colors.orange,
                  error: Colors.black,
                  onError: Colors.red,
                  surface: Color.fromARGB(255, 246, 246, 247),
                  onSurface: Colors.blueGrey,
                )), //provider.lightColor),
            darkTheme: ThemeData(
                useMaterial3: false,
                colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: Color.fromARGB(255, 253, 195, 2),
                  onPrimary: Color(0xFF5C113B),
                  primaryContainer: Color(0xFF792952),
                  onPrimaryContainer: Color(0xFFFFD8E6),
                  secondary: Color(0xFFE1BDCA),
                  onSecondary: Color(0xFF412A33),
                  error: Colors.yellow,
                  onError: Colors.orange,
                  surface: Colors.black,
                  onSurface: Colors.black87,
                )),
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
