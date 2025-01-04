import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/theme/theme_provider.dart';
import 'package:arfoon_note/frontend/utils/utils.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OpenSettingsDialog extends StatefulWidget {
  String? languageCode;
  String? themeMode;
  OpenSettingsDialog({
    super.key,
    required this.languageCode,
    required this.themeMode,
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
    // String? themeValue = 'System Theme';
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
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary,
                BlendMode.srcIn,
              ),
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
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
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
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
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
                onChanged: (value) async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  widget.themeMode = value;
                  if (widget.themeMode == 'Light') {
                    themeProvider.toggleTheme(ThemeData.light());
                  } else if (widget.themeMode == 'Dark') {
                    themeProvider.toggleTheme(ThemeData.dark());
                  } else {
                    themeProvider.currentTheme = AppTheme.system;
                  }
                  preferences.setString(
                      'theme', themeProvider.currentTheme.name);
                },
                onSaved: (newValue) {
                  setState(() {
                    widget.themeMode = newValue;
                  });
                },
                value: widget.themeMode,
              ),
            ],
          ),
          const VerticalSpacer(space: 20),
        ]);
  }
}
