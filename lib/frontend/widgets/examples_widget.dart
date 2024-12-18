// ignore_for_file: file_names

import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({
    super.key,
    // required this.title,
    // required this.subtitle,
    required this.data,
  });

  // final String title, subtitle;
  final Map data;
  bool isIndexEven(int num) {
    if ((num %= 2) == 0) {
      return true;
    }
    return false;
  }

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isIndexEven(int.parse(widget.data['index']))
          ? Colors.white.withOpacity(0.1)
          : Colors.white10,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      // width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacer(space: 5),
          Text(
            widget.data['title'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const VerticalSpacer(space: 5),
          Text(
            widget.data['subtitle'],
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
