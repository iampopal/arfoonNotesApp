import 'dart:io';

import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/features/home/home_desktop_view.dart';
import 'package:arfoon_note/frontend/features/home/notes_list.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension ContextExt on BuildContext {
  bool get isDesktop => MediaQuery.of(this).size.width > 700;
}

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    this.onNewLabel,
    required this.getNotes,
  });
  final Future<Label?> Function()? onNewLabel;
  final Future<List<Note>> Function(Filter filter) getNotes;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    // if (context.isDesktop) {
    //   return HomeDesktopView(onNewLabel: widget.onNewLabel);
    // }
    return Scaffold(
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
      body: NotesList(
        isPhone: true,
        getNotes: widget.getNotes,
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
