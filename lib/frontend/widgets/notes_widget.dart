// ignore_for_file: file_names
import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';

class NotesWidget extends StatelessWidget {
  final int currentIndex;
  final Note note;
  const NotesWidget(
      {super.key, required this.note, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: note.pinned ?? false ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.date ?? '',
                style: TextStyle(
                  color: note.pinned ?? false ? Colors.white : Colors.black,
                ),
              ),
              const VerticalSpacer(space: 6),
              Text(
                note.title ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: note.pinned ?? false ? Colors.white : Colors.black,
                  fontSize: 23,
                ),
              ),
              const VerticalSpacer(space: 6),
              Text(
                note.details ?? '',
                style: TextStyle(
                  color: note.pinned ?? false ? Colors.white : Colors.black,
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
                  for (var item in note.techs ?? [])
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: note.pinned ?? false
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
          right: context.currentLocale?.languageCode == 'en' ? 38 : 340,
          top: 25,
          child: GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print(currentIndex);
                print(note.pinned);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: note.pinned ?? false ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AppAssets.pinOutlined,
                  color: note.pinned ?? false ? Colors.white : Colors.black,
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
