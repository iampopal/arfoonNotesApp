// ignore_for_file: file_names

import 'package:arfoon_note/client/models/label.dart';
import 'package:flutter/material.dart';

class FiltersWidget extends StatelessWidget {
  final Label title;
  const FiltersWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 60,
      // height: 40,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: title.name == 'All Notes' ? Colors.black : Colors.white,
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
          color: title.name == 'All Notes' ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
