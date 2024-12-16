import 'package:arfoon_note/frontend/data/data.dart';
import 'package:arfoon_note/frontend/features/home/home_view.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Examples',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: FakeData()
                    .examplesData
                    .map((data) => InkWell(
                        splashColor: Colors.black12,
                        onTap: () {
                          if (int.parse(data['index']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                            );
                          } else if (int.parse(data['index']) == 1) {
                            Utils().openProfileDialog(context: context);
                          } else if (int.parse(data['index']) == 2) {
                            Utils().openSettingsDialog(context: context);
                          } else if (int.parse(data['index']) == 3) {
                            Utils().openAddLabelDialog(context: context);
                          } else {}
                        },
                        child: ExampleWidget(data: data)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
