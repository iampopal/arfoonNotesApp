// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class HorizontalSpacer extends StatelessWidget {
  final double space;
  const HorizontalSpacer({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
