// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/data/data.dart';
import 'package:arfoon_note/frontend/features/home/home_example.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/add_profile_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/open_settings_dialog.dart';
import 'package:arfoon_note/frontend/widgets/examples_widget.dart';

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
          exampleButton(
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeExample(),
                ),
              );
            },
            FakeData().examplesData[0].title,
            FakeData().examplesData[0].subTitle,
            0,
          ),
          exampleButton(
            context,
            () {
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
            FakeData().examplesData[1].title,
            FakeData().examplesData[1].subTitle,
            1,
          ),
          exampleButton(
            context,
            () {
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
            FakeData().examplesData[2].title,
            FakeData().examplesData[2].subTitle,
            2,
          ),
          exampleButton(
            context,
            () {
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
            FakeData().examplesData[3].title,
            FakeData().examplesData[3].subTitle,
            3,
          ),
          exampleButton(
            context,
            () {},
            FakeData().examplesData[4].title,
            FakeData().examplesData[4].subTitle,
            4,
          ),
        ],
      ),
    );
  }
}

InkWell exampleButton(BuildContext context, VoidCallback onTap, String? title,
    String? details, int index) {
  return InkWell(
    splashColor: Colors.black12,
    onTap: onTap,
    child: ExampleWidget(
      title: title ?? "",
      details: details ?? "",
      currentIndex: index,
    ),
  );
}
