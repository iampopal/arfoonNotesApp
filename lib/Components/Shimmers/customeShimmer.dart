import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  CustomShimmer(
      {Key? key,
      required this.height,
      required this.width,
      this.borderRadiusValue,
      this.boxDecoration,
      this.baseColor,
      this.widget})
      : super(key: key);
  double height, width;
  double? borderRadiusValue;
  BoxDecoration? boxDecoration;
  Color? baseColor, highlightColor;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? const Color.fromARGB(255, 236, 232, 232),
        highlightColor:
            highlightColor ?? const Color.fromARGB(26, 223, 222, 222),
        child: Container(
          width: width,
          height: height,
          decoration: boxDecoration ??
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadiusValue ?? 8),
              ),
          child: widget,
        ),
      ),
    );
  }
}
