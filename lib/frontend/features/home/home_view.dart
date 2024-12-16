import 'dart:io';

import 'package:arfoon_note/frontend/features/home/home_desktop_view.dart';
import 'package:arfoon_note/frontend/features/home/home_example.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    return Platform.isWindows
        ? const HomeDesktopView()
        : Scaffold(
            key: key,
            drawer: const Menu(),
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  key.currentState?.openDrawer();
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
            body: HomeExampleView(
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
