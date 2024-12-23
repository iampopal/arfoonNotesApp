import 'package:arfoon_note/frontend/data/data.dart';
import 'package:arfoon_note/frontend/features/home/home_example.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/add_profile_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/open_settings_dialog.dart';
import 'package:arfoon_note/frontend/widgets/examples_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('Examples'),
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
              const OpenSettingsDialog().show(context: context);
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
