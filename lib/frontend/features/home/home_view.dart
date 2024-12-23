import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/features/home/notes_list.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';

extension ContextExt on BuildContext {
  bool get isDesktop => MediaQuery.of(this).size.width > 700;
}

class HomeView extends StatefulWidget {
  const HomeView({
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
        elevation: 0,
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
        title: Text(Locales.string(context,"Arfoon Notes")),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      body: NotesList(
        isPhone: true,
        getNotes: widget.getNotes,
        getLabels: widget.getLabels,
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
