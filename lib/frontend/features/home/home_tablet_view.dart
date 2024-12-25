import 'dart:developer';

import 'package:arfoon_note/client/models/filter.dart';
import 'package:arfoon_note/client/models/label.dart';
import 'package:arfoon_note/client/models/note.dart';
import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/features/home/notes_list.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTabletView extends StatefulWidget {
  const HomeTabletView({
    super.key,
    this.onNewLabel,
    required this.getNotes,
    required this.getLabels,
  });

  final Future<Label?> Function()? onNewLabel;
  final Future<List<Note>> Function(Filter filter, bool isSearchedByLabel)
      getNotes;
  final Future<List<Label>> Function(Filter filter) getLabels;

  @override
  State<HomeTabletView> createState() => _HomeTabletViewState();
}

class _HomeTabletViewState extends State<HomeTabletView> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const Menu(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            log('I am pressed${key.currentState}');
            key.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AppAssets.menu,
            ),
          ),
        ),
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
        mainAxisSize: MainAxisSize.max,
        children: [
          // Expanded(
          //   flex: 3,
          //   child: Menu(onNewLabel: widget.onNewLabel),
          // ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                right: BorderSide(width: 0.3),
              )),
              child: NotesList(
                isPhone: false,
                getNotes: widget.getNotes,
                getLabels: widget.getLabels,
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
