import 'dart:developer';

import 'package:arfoon_note/frontend/colors/app_colors.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/utils/utils.dart';
import 'package:arfoon_note/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OpenSettingsDialog extends StatefulWidget {
  String? languageCode;
  OpenSettingsDialog({
    super.key,
    required this.languageCode,
  });

  Future show({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  State<OpenSettingsDialog> createState() => _OpenSettingsDialogState();
}

class _OpenSettingsDialogState extends State<OpenSettingsDialog> {
  @override
  Widget build(BuildContext context) {
    // String? languageValue;
    // if (widget.languageCode == 'en') {
    //   languageValue = Utils().languageDropDownItems[0].value;
    // } else if (widget.languageCode == 'ps') {
    //   languageValue = Utils().languageDropDownItems[1].value;
    // } else {
    //   languageValue = Utils().languageDropDownItems[2].value;
    // }
    String? themeValue = 'System Theme';
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SimpleDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.settings,
              height: 60,
              width: 60,
            ),
            Text(
              Locales.string(context, 'arfoon_notes_settings'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        children: [
          const VerticalSpacer(space: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(Locales.string(context, 'change_language')),
              const VerticalSpacer(space: 10),
              DropdownButtonFormField<String>(
                items: Utils().languageDropDownItems,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Rubik',
                ),
                elevation: 24,
                iconEnabledColor: Colors.black,
                isDense: true,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5, top: 3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  //border: OutlineInputBorder(),
                ),
                iconSize: 20,
                onChanged: (value) {
                  widget.languageCode = value;
                  if (widget.languageCode == 'ps') {
                    Locales.change(context, 'ps');
                    setState(() {});
                  } else if (widget.languageCode == 'fa') {
                    Locales.change(context, 'fa');
                  } else {
                    Locales.change(context, 'en');
                  }
                },
                onSaved: (newValue) {
                  widget.languageCode = newValue;
                },
                value: widget.languageCode,
              ),
              const VerticalSpacer(space: 10),
              Text(Locales.string(context, 'change_theme')),
              const VerticalSpacer(space: 10),
              DropdownButtonFormField<String>(
                items: Utils().themeDropDownItems,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Rubik',
                ),
                elevation: 24,
                iconEnabledColor: Colors.black,
                isDense: true,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5, top: 3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  //border: OutlineInputBorder(),
                ),
                iconSize: 20,
                onChanged: (value) {
                  themeValue = value;
                  if (themeValue == 'Light') {
                    themeProvider.toggleTheme(ThemeData.light());
                  } else {
                    themeProvider.toggleTheme(ThemeData.dark());
                  }
                },
                onSaved: (newValue) {
                  themeValue = newValue;
                },
                value: themeValue,
              ),
            ],
          ),
          const VerticalSpacer(space: 20),
        ]);
  }
}
