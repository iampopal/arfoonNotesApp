import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/components/shimmers/custome_shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeExampleShimmer extends StatelessWidget {
  const HomeExampleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 242, 241, 241),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomShimmer(
                      height: 20,
                      width: 70,
                      borderRadiusValue: 5,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CustomShimmer(
                      height: 100,
                      width: double.infinity,
                      borderRadiusValue: 20,
                    ),
                  ),
                  const VerticalSpacer(space: 15),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        CustomShimmer(
                          height: 40,
                          width: 80,
                          borderRadiusValue: 10,
                        ),
                        const HorizontalSpacer(space: 15),
                        CustomShimmer(
                          height: 40,
                          width: 80,
                          borderRadiusValue: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 242, 241, 241),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomShimmer(
                      height: 20,
                      width: 70,
                      borderRadiusValue: 5,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CustomShimmer(
                      height: 100,
                      width: double.infinity,
                      borderRadiusValue: 20,
                    ),
                  ),
                  const VerticalSpacer(space: 15),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        CustomShimmer(
                          height: 40,
                          width: 80,
                          borderRadiusValue: 10,
                        ),
                        const HorizontalSpacer(space: 15),
                        CustomShimmer(
                          height: 40,
                          width: 80,
                          borderRadiusValue: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 242, 241, 241),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomShimmer(
                      height: 20,
                      width: 70,
                      borderRadiusValue: 5,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CustomShimmer(
                      height: 100,
                      width: double.infinity,
                      borderRadiusValue: 20,
                    ),
                  ),
                  const VerticalSpacer(space: 15),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        CustomShimmer(
                          height: 40,
                          width: 80,
                          borderRadiusValue: 10,
                        ),
                        const HorizontalSpacer(space: 15),
                        CustomShimmer(
                          height: 40,
                          width: 80,
                          borderRadiusValue: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
