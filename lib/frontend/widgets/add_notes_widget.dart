// ignore_for_file: file_names

import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/features/features.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/providers/notes_provider.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController selectedNoteTitle = TextEditingController();
  TextEditingController selectedNoteDescription = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedNoteTitle.text = '';
      selectedNoteDescription.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //First Row for Title
                  Row(
                    children: [
                      !context.isDesktop && !context.isTablet
                          ? const SizedBox()
                          : Text(
                              Locales.string(context, 'my_notes'),
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                      !context.isDesktop && !context.isTablet
                          ? const SizedBox()
                          : SizedBox(
                              height: 10,
                              width: 10,
                              child: SvgPicture.asset(
                                AppAssets.arrowForward,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.secondary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                      !context.isDesktop && !context.isTablet
                          ? const SizedBox()
                          : Consumer<NotesProvider>(
                              builder: (context, notesProvider, child) {
                              return Text(
                                selectedNoteTitle.text == ''
                                    ? Locales.string(context, 'untitled')
                                    : selectedNoteTitle.text,
                                style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              );
                            })
                    ],
                  ),
                  //Second Row for Actions
                  !context.isDesktop && !context.isTablet
                      ? const Visibility(visible: false, child: SizedBox())
                      : Row(
                          children: [
                            Text(
                              'Updated on Dec 17',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 10,
                              ),
                            ),
                            const HorizontalSpacer(space: 10),
                            Consumer<ThemeProvider>(
                              builder: (context, themeProvider, child) {
                                return ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.saveChanges,
                                        colorFilter: ColorFilter.mode(
                                          Theme.of(context).colorScheme.primary,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const HorizontalSpacer(space: 10),
                                      Text(
                                        Locales.string(context, 'save_changes'),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const HorizontalSpacer(space: 10),
                            SvgPicture.asset(
                              AppAssets.more,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.secondary,
                                BlendMode.srcIn,
                              ),
                            ),
                            const HorizontalSpacer(space: 10),
                          ],
                        ),
                ],
              ),
              !context.isDesktop || !context.isTablet
                  ? const Visibility(visible: false, child: SizedBox())
                  : Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 0.1,
                    ),
              !context.isDesktop && !context.isTablet
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Updated on Dec 17',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Consumer<NotesProvider>(builder: (context, notesProvider, child) {
                selectedNoteTitle = notesProvider.selectedNoteTitle;
                return TextField(
                  controller: selectedNoteTitle,
                  autofocus: true,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: Locales.string(context, 'untitled'),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              }),
              Consumer<NotesProvider>(builder: (context, notesProvider, child) {
                selectedNoteDescription = notesProvider.selectedNoteDescription;
                return TextField(
                  controller: selectedNoteDescription,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autofocus: true,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: Locales.string(context, 'description'),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              }),
              // Text(
              //   Locales.string(context, 'description'),
              //   style: TextStyle(
              //     color: Theme.of(context).colorScheme.secondary,
              //     fontSize: 15,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
