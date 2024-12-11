// ignore_for_file: file_names

import 'package:afroon_test_project/AppData/appData.dart';
import 'package:afroon_test_project/Helpers/appAssets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Space/VerticalSpacer.dart';

class NotesWidget extends StatelessWidget {
  final int currentIndex;
  final Map<String, dynamic> notes;
  const NotesWidget(
      {super.key, required this.notes, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: notes['pinned'] == 'true' ? Colors.blue : Colors.grey[200],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes['date'],
                style: TextStyle(
                  color:
                      notes['pinned'] == 'true' ? Colors.white : Colors.black,
                ),
              ),
              const VerticalSpacer(space: 6),
              Text(
                notes['title'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color:
                      notes['pinned'] == 'true' ? Colors.white : Colors.black,
                  fontSize: 23,
                ),
              ),
              const VerticalSpacer(space: 6),
              Text(
                notes['note'],
                style: TextStyle(
                  color:
                      notes['pinned'] == 'true' ? Colors.white : Colors.black,
                  fontSize: 13,
                ),
              ),
              const VerticalSpacer(space: 6),
              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [],
              // ),
              Row(
                children: [
                  for (var item in notes['techs'])
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: notes['pinned'] == 'true'
                            ? Colors.white
                            : Colors.grey[300],
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 38,
          top: 25,
          child: GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print(currentIndex);
                print(AppData().notes[currentIndex]['pinned']);
                AppData().notes[currentIndex]['pinned'] = 'true';
                // AppData().notes[currentIndex]['pinned'] = 'true';
                print(AppData().notes[currentIndex]['pinned']);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: notes['pinned'] == 'true' ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AppAssets.pinOutlined,
                  color:
                      notes['pinned'] == 'true' ? Colors.white : Colors.black,
                  height: 15,
                  width: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
