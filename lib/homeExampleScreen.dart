// ignore_for_file: file_names

import 'dart:io';
import 'package:afroon_test_project/addNoteScreen.dart';
import 'package:afroon_test_project/Components/Space/HorizontalSpacer.dart';
import 'package:afroon_test_project/Components/Space/VerticalSpacer.dart';
import 'package:afroon_test_project/Helpers/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppData/appData.dart';
import 'Components/FiltersWidget.dart';
import 'Components/Menu.dart';
import 'Components/NotesWidget.dart';

class HomeExampleScreen extends StatefulWidget {
  const HomeExampleScreen({super.key});

  @override
  State<HomeExampleScreen> createState() => _HomeExampleScreenState();
}

class _HomeExampleScreenState extends State<HomeExampleScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Platform.isWindows
        ? const HomeDesktopView()
        : Scaffold(
            key: _key,
            drawer: const Menu(),
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  _key.currentState?.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppAssets.menu,
                  ),
                ),
              ),
              centerTitle: true,
              title: const Text('Arfoon Notes'),
            ),
            body: const HomeExampleView(
              isPhone: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNoteScreen(isPhone: true),
                    ));
              },
              tooltip: 'Add Note',
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: SvgPicture.asset(AppAssets.addNew),
            ),
          );
  }
}

class HomeExampleView extends StatelessWidget {
  final bool isPhone;
  const HomeExampleView({super.key, required this.isPhone});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          isPhone
              ? const Visibility(
                  visible: false,
                  child: SizedBox(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('My Notes'),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppAssets.addNew),
                            const Text('New'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          const VerticalSpacer(space: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppAssets.search,
                  ),
                ),
                hintText: 'Search Notes',
              ),
            ),
          ),
          const VerticalSpacer(space: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: AppData()
                  .filters
                  .map((filter) => FiltersWidget(title: filter))
                  .toList(),
            ),
          ),
          const VerticalSpacer(space: 20),
          Column(
            children: AppData()
                .notes
                .asMap()
                .map((i, element) => MapEntry(
                    i,
                    NotesWidget(
                      notes: element,
                      currentIndex: i,
                    )))
                .values
                .toList(),
          )
        ],
      ),
    );
  }
}

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                AppAssets.logo,
              ),
            ),
            const HorizontalSpacer(space: 5),
            const Text(
              'Arfoon Note',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          const Expanded(
            flex: 3,
            child: Menu(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                right: BorderSide(width: 0.3),
              )),
              child: const HomeExampleView(
                isPhone: false,
              ),
            ),
          ),
          const Expanded(
            flex: 6,
            child: AddNoteScreen(isPhone: false),
          )
        ],
      ),
    );
  }
}
