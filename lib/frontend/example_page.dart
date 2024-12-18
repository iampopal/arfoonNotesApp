import 'package:arfoon_note/frontend/data/data.dart';
import 'package:arfoon_note/frontend/features/home/home_example.dart';
import 'package:arfoon_note/frontend/features/home/home_view.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/utils.dart';
import 'package:arfoon_note/frontend/widgets/examples_widget.dart';
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeExample(),
                ),
              );
            },
            child: Text('Home Example'),
          ),
          ElevatedButton(
            onPressed: () {
              AddEditLabelDialog(
                onSubmit: (label) async {
                  await Future.delayed(const Duration(seconds: 1));
                  // Navigator.pop(context);
                  print(label);
                },
              ).show(context: context);
            },
            child: Text('AddEditDialog'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: FakeData.examplesData
                .map(
                  (data) => InkWell(
                    splashColor: Colors.black12,
                    onTap: () {
                      if (int.parse(data['index']) == 0) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomeView(),
                        //   ),
                        // );
                      } else if (int.parse(data['index']) == 1) {
                        Utils().openProfileDialog(context: context);
                      } else if (int.parse(data['index']) == 2) {
                        Utils().openSettingsDialog(context: context);
                      } else if (int.parse(data['index']) == 3) {
                        // Utils().openAddLabelDialog(context: context);
                      } else {}
                    },
                    child: ExampleWidget(data: data),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
