// ignore_for_file: file_names
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({
    super.key,
    required this.title,
    required this.details,
    required this.currentIndex,
  });

  final int currentIndex;
  final String title;
  final String details;
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
      color: widget.isIndexEven(widget.currentIndex)
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
            Locales.string(context, widget.title),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.black,
              fontSize: 25,
            ),
          ),
          const VerticalSpacer(space: 5),
          Text(
            widget.details,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              // color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
