import 'package:arfoon_note/client/models/filter.dart';
import 'package:arfoon_note/client/models/label.dart';
import 'package:arfoon_note/client/models/note.dart';
import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/features/home/notes_list.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
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
  final Future<List<Label>> Function() getLabels;

  @override
  State<HomeTabletView> createState() => _HomeTabletViewState();
}

class _HomeTabletViewState extends State<HomeTabletView> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  AppAssets.logo,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const HorizontalSpacer(space: 5),
            Text(
              Locales.string(context, 'arfoon_notes'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                // isPhone: false,
                getNotes: widget.getNotes,
                getLabels: widget.getLabels,
              ),
            ),
          ),
          const Expanded(
            flex: 6,
            child: AddNoteScreen(),
          )
        ],
      ),
    );
  }
}
