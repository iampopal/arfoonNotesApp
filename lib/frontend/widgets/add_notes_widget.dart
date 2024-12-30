// ignore_for_file: file_names

import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  final bool isPhone;
  const AddNoteScreen({super.key, required this.isPhone});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.isPhone
                ? const SizedBox()
                : const Text(
                    'My Notes',
                    style: TextStyle(fontSize: 10),
                  ),
            widget.isPhone
                ? const SizedBox()
                : SizedBox(
                    height: 10,
                    width: 10,
                    child: SvgPicture.asset(AppAssets.arrowForward)),
            widget.isPhone
                ? const SizedBox()
                : const Text(
                    'Untitled',
                    style: TextStyle(fontSize: 10),
                  )
          ],
        ),
        leading: widget.isPhone
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                  return Icon(
                    Icons.arrow_back_ios_outlined,
                    color: themeProvider.currentTheme == AppTheme.dark
                        ? Colors.white
                        : Colors.black,
                  );
                }),
              )
            : const Visibility(visible: false, child: SizedBox()),
        actions: widget.isPhone
            ? [
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return SvgPicture.asset(
                      AppAssets.more,
                      colorFilter: ColorFilter.mode(
                        themeProvider.currentTheme == AppTheme.dark
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcIn,
                      ),
                    );
                  },
                )
              ]
            : [
                Text(
                  'Updated on Dec 17',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10,
                  ),
                ),
                const HorizontalSpacer(space: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                          return SvgPicture.asset(
                            AppAssets.saveChanges,
                            colorFilter: ColorFilter.mode(
                              themeProvider.currentTheme == AppTheme.dark
                                  ? Colors.white
                                  : Colors.black,
                              BlendMode.srcIn,
                            ),
                          );
                        },
                      ),
                      const HorizontalSpacer(space: 10),
                      const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const HorizontalSpacer(space: 10),
                SvgPicture.asset(AppAssets.more),
                const HorizontalSpacer(space: 10),
              ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isPhone
                  ? Text(
                      'Updated on Dec 17',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                      ),
                    )
                  : const SizedBox(),
              TextField(
                autofocus: true,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: InputDecoration(
                  hintText: Locales.string(context, "untitled"),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                Locales.string(context, 'description'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
