// ignore_for_file: must_be_immutable

import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/components/shimmers/home_example_shimmers.dart';
import 'package:arfoon_note/frontend/data/fake_data.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/filters_widget.dart';
import 'package:arfoon_note/frontend/widgets/notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeExampleView extends StatefulWidget {
  final bool isPhone;
  bool isLoading = true;
  HomeExampleView({super.key, required this.isPhone});

  @override
  State<HomeExampleView> createState() => _HomeExampleViewState();
}

class _HomeExampleViewState extends State<HomeExampleView> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        widget.isLoading = false;
      });
    });
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
          widget.isLoading
              ? const HomeExampleShimmer()
              : Column(
                  children: FakeData()
                      .notes
                      .asMap()
                      .map((i, element) => MapEntry(
                          i,
                          NotesWidget(
                            note: element,
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
