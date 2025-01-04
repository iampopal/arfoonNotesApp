// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/components/shimmers/home_example_shimmers.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/filters_widget.dart';
import 'package:arfoon_note/frontend/widgets/notes_widget.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  final bool isPhone;
  const NotesList({
    super.key,
    required this.isPhone,
    required this.getNotes,
    required this.getLabels,
  });
  final Future<List<Note>> Function(Filter filter, bool isSearchedByLabel)
      getNotes;
  final Future<List<Label>> Function() getLabels;

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<Note> notes = [];
  List<Label> labels = [];
  bool loading = true;
  String? error;

  //Variables for controlling the infinite scroll
  final _scrollController = ScrollController();
  final bool _isLoading = false;
  String? _error;

  void _loadMore() {
    log('outside if condition');
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      log('Call again');
      _getNotes();
    }
  }

  _getLabels() async {
    try {
      setState(() {
        error = null;
        loading = true;
      });
      labels = await widget.getLabels();
      if (labels.isEmpty) {
        labels.insert(
          0,
          Label(name: 'All Notes'),
        );
        labels.insert(
          1,
          Label(name: 'Office'),
        );
        labels.insert(
          2,
          Label(name: 'Home'),
        );
      } else {
        labels = List.from(labels);
      }
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  _getNotes(
      {int page = 5, String? search, bool isSearchByLabel = false}) async {
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
        isSearchByLabel,
      );
      notes = List.from(notes);
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  initState() {
    super.initState();
    _getLabels();
    _scrollController.addListener(_loadMore);
    if (_scrollController.hasClients) {
      log(_scrollController.toString());
    }
    _getNotes();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController notesSearchController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                      Text(Locales.string(context, "arfoon_notes")),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.secondary),
                          foregroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.addNew,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn,
                              ),
                            ),
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
              controller: notesSearchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppAssets.search,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                hintText: Locales.string(context, "search_notes"),
              ),
            ),
          ),
          const VerticalSpacer(space: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: labels
                  .asMap()
                  .map(
                    (i, element) => MapEntry(
                      i,
                      Consumer<ThemeProvider>(
                        builder: (context, themeprovider, child) {
                          return GestureDetector(
                            onTap: () {
                              themeprovider.selectCurrentLabel(element.name);
                              _getNotes(
                                  search: element.name, isSearchByLabel: true);
                              setState(() {});
                            },
                            child: FiltersWidget(
                              title: element,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                  .values
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
        children: [
          Text('ERROR\n$error'),
          _buildRetry(),
        ],
      ));
    }
    if (loading) {
      return const HomeExampleShimmer();
    }

    if (notes.isEmpty) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Locales.string(context, "no_notes_found")),
          _buildRetry(),
        ],
      ));
    }
    return _error != null
        ? Center(child: Text('Error: $_error'))
        : ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: notes.length + (_isLoading ? 1 : 0),
            itemBuilder: (BuildContext context, int index) {
              if (index == notes.length) {
                return const Center(child: HomeExampleShimmer());
              } else {
                return NotesWidget(note: notes[index], currentIndex: index);
              }
            },
          );
    // return Column(
    //   children: notes
    //       .asMap()
    //       .map((i, element) => MapEntry(
    //           i,
    //           NotesWidget(
    //             note: element,
    //             currentIndex: i,
    //           )))
    //       .values
    //       .toList(),
    // );
  }

  ElevatedButton _buildRetry() {
    return ElevatedButton(
      onPressed: () {
        _getNotes();
      },
      style: ButtonStyle(
        foregroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.secondary),
      ),
      child: Text(Locales.string(context, "Retry")),
    );
  }
}
