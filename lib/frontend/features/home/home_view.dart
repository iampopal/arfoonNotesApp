import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/data/fake_data.dart';
import 'package:arfoon_note/frontend/features/home/home_desktop_view.dart';
import 'package:arfoon_note/frontend/features/home/home_tablet_view.dart';
import 'package:arfoon_note/frontend/features/home/notes_list.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';

extension ContextExt on BuildContext {
  bool get isDesktop => MediaQuery.of(this).size.width > 1100;
  bool get isTablet => MediaQuery.of(this).size.width > 700;
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
  final Future<List<Label>> Function() getLabels;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int notes = 0;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    if (context.isDesktop) {
      return HomeDesktopView(
        getNotes: (filter, isSearchedByLabel) async {
          await Future.delayed(const Duration(seconds: 2));
          if (notes == 0) {
            notes++;
            throw 'Something error like from example';
          }
          if (notes == 1) {
            notes++;
            return [];
          }
          if ((filter.search ?? '').isNotEmpty && !isSearchedByLabel) {
            var list = FakeData()
                .notes
                .where((e) => e.title!
                    .toLowerCase()
                    .contains(filter.search!.toLowerCase()))
                .toList();
            return list;
          }
          if ((filter.search ?? '').isNotEmpty && isSearchedByLabel) {
            var list = FakeData()
                .notes
                .where((e) => e.techs!.contains(filter.search))
                .toList();
            return list;
          }
          return FakeData().notes;
        },
        getLabels: () async {
          await Future.delayed(const Duration(milliseconds: 1));
          return FakeData().labels;
        },
        onNewLabel: () async {
          AddEditLabelDialog(
            onSubmit: (l) async {},
          ).show(context: context);
          return null;
        },
      );
    }
    if (context.isTablet) {
      return HomeTabletView(
        getNotes: (filter, isSearchedByLabel) async {
          await Future.delayed(const Duration(seconds: 2));
          if (notes == 0) {
            notes++;
            throw 'Something error like from example';
          }
          if (notes == 1) {
            notes++;
            return [];
          }
          if ((filter.search ?? '').isNotEmpty && !isSearchedByLabel) {
            var list = FakeData()
                .notes
                .where((e) => e.title!
                    .toLowerCase()
                    .contains(filter.search!.toLowerCase()))
                .toList();
            return list;
          }
          if ((filter.search ?? '').isNotEmpty && isSearchedByLabel) {
            var list = FakeData()
                .notes
                .where((e) => e.techs!.contains(filter.search))
                .toList();
            return list;
          }
          return FakeData().notes;
        },
        getLabels: () async {
          await Future.delayed(const Duration(milliseconds: 1));
          return FakeData().labels;
        },
        onNewLabel: () async {
          AddEditLabelDialog(
            onSubmit: (l) async {},
          ).show(context: context);
          return null;
        },
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(Locales.string(context, "arfoon_notes")),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
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
                builder: (context) => const AddNoteScreen(),
              ));
        },
        tooltip: 'Add Note',
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset(
          AppAssets.addNew,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
