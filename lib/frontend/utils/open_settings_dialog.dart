import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OpenSettingsDialog extends StatefulWidget {
  const OpenSettingsDialog({super.key});

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
    String? languageValue = 'English';
    String? themeValue = 'System Theme';
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
            const Text(
              'Arfoon Notes Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
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
              const Text('Change Language'),
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
                  languageValue = value;
                },
                onSaved: (newValue) {
                  languageValue = newValue;
                },
                value: languageValue,
              ),
              const VerticalSpacer(space: 10),
              const Text('Change Theme'),
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
