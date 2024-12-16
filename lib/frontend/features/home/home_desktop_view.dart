import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/features/home/home_example.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/widgets/add_notes_widget.dart';
import 'package:arfoon_note/frontend/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                AppAssets.logo,
              ),
            ),
            const HorizontalSpacer(space: 5),
            const Text(
              'Arfoon Note',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
            flex: 3,
            child: Menu(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                right: BorderSide(width: 0.3),
              )),
              child: HomeExampleView(
                isPhone: false,
              ),
            ),
          ),
          const Expanded(
            flex: 6,
            child: AddNoteScreen(isPhone: false),
          )
        ],
      ),
    );
  }
}
