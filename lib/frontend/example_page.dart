import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/data/data.dart';
import 'package:arfoon_note/frontend/features/home/home_example.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/add_profile_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/open_settings_dialog.dart';
import 'package:arfoon_note/frontend/widgets/examples_widget.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        title: Text(Locales.string(context, 'examples')),
        elevation: 0,
      ),
      body: ListView(
        children: [
          InkWell(
            splashColor: Colors.black12,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeExample(),
                ),
              );
            },
            child: ExampleWidget(
              data: FakeData().examplesData[0],
              currentIndex: 0,
            ),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {
              AddProfileLabelDialog(
                onSubmit: (label) async {
                  await Future.delayed(const Duration(seconds: 1));
                  // Navigator.pop(context);
                  if (kDebugMode) {
                    print(label);
                  }
                },
              ).show(context: context);
            },
            child: ExampleWidget(
              data: FakeData().examplesData[1],
              currentIndex: 1,
            ),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {
              String? currentTheme;
              if (themeProvider.currentTheme == AppTheme.dark) {
                currentTheme = 'Dark';
              } else if (themeProvider.currentTheme == AppTheme.light) {
                currentTheme = 'Light';
              } else {
                currentTheme = 'System Theme';
              }
              OpenSettingsDialog(
                themeMode: currentTheme,
                languageCode:
                    Locales.currentLocale(context)?.languageCode ?? "en",
              ).show(context: context);
            },
            child: ExampleWidget(
              data: FakeData().examplesData[2],
              currentIndex: 2,
            ),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {
              AddEditLabelDialog(
                onDelete: (l) async {},
                label: Label(name: 'Yess'),
                onSubmit: (label) async {
                  await Future.delayed(const Duration(seconds: 1));
                  // Navigator.pop(context);
                  if (kDebugMode) {
                    print(label);
                  }
                },
              ).show(context: context);
            },
            child: ExampleWidget(
              data: FakeData().examplesData[3],
              currentIndex: 3,
            ),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {},
            child: ExampleWidget(
              data: FakeData().examplesData[4],
              currentIndex: 4,
            ),
          ),
        ],
      ),
    );
  }
}
