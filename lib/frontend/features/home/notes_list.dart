// ignore_for_file: must_be_immutable

import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/components/shimmers/home_example_shimmers.dart';
import 'package:arfoon_note/frontend/data/fake_data.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/filters_widget.dart';
import 'package:arfoon_note/frontend/widgets/notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotesList extends StatefulWidget {
  final bool isPhone;
  const NotesList({
    super.key,
    required this.isPhone,
    required this.getNotes,
  });
  final Future<List<Note>> Function(Filter filter) getNotes;

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<Note> notes = [];
  bool loading = true;
  String? error;

  _getNotes({int page = 0, String? search}) async {
    try {
      setState(() {
        error = null;
        loading = true;
      });
      notes = await widget.getNotes(
        Filter(
          page: page,
          search: search,
        ),
      );
      notes = List.from(notes);
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  initState() {
    super.initState();
    _getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.isPhone
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
                              WidgetStateProperty.all(Colors.black),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
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
              onFieldSubmitted: (s) {
                _getNotes(search: s);
              },
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
              children: FakeData()
                  .filters
                  .map((filter) => FiltersWidget(title: filter))
                  .toList(),
            ),
          ),
          const VerticalSpacer(space: 20),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (error != null) {
      return Center(
          child: Column(
        children: [Text('ERROR\n$error'), _buildRetry()],
      ));
    }
    if (loading) {
      return const HomeExampleShimmer();
    }

    if (notes.isEmpty) {
      return Center(
          child: Column(
        children: [
          Text('No Notes Found'),
          _buildRetry(),
        ],
      ));
    }

    return Column(
      children: notes
          .asMap()
          .map((i, element) => MapEntry(
              i,
              NotesWidget(
                note: element,
                currentIndex: i,
              )))
          .values
          .toList(),
    );
  }

  ElevatedButton _buildRetry() {
    return ElevatedButton(
      onPressed: () {
        _getNotes();
      },
      child: Text('Retry'),
    );
  }
}
