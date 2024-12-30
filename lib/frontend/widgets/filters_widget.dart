// ignore_for_file: file_names

import 'package:arfoon_note/client/models/label.dart';
import 'package:arfoon_note/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersWidget extends StatelessWidget {
  final Label title;
  const FiltersWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          // width: 60,
          // height: 40,
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: themeProvider.currentSelectedLabel == title.name
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(150),
            border: Border.all(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          child: Text(
            title.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: themeProvider.currentSelectedLabel == title.name
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
        );
      },
    );
  }
}
