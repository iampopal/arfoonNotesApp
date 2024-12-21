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
      appBar: AppBar(
        title: const Text('Examples'),
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
            child: ExampleWidget(data: FakeData.examplesData[0]),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {
              AddProfileLabelDialog(
                onSubmit: (label) async {
                  await Future.delayed(const Duration(seconds: 1));
                  // Navigator.pop(context);
                  print(label);
                },
              ).show(context: context);
            },
            child: ExampleWidget(data: FakeData.examplesData[1]),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {
              const OpenSettingsDialog().show(context: context);
            },
            child: ExampleWidget(data: FakeData.examplesData[2]),
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
            child: ExampleWidget(data: FakeData.examplesData[3]),
          ),
          InkWell(
            splashColor: Colors.black12,
            onTap: () {},
            child: ExampleWidget(data: FakeData.examplesData[4]),
          ),
        ],
      ),
    );
  }
}
