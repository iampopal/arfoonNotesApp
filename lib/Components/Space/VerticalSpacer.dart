// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class VerticalSpacer extends StatelessWidget {
  final double space;
  const VerticalSpacer({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
