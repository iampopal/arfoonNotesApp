// ignore_for_file: file_names
import 'package:arfoon_note/client/models/label.dart';
import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/add_profile_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/open_settings_dialog.dart';
import 'package:arfoon_note/integration/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key, this.onNewLabel});
  final Future<Label?> Function()? onNewLabel;
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // VerticalSpacer(space: 40),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.logo,
                    height: 45,
                    width: 45,
                  ),
                  const VerticalSpacer(space: 5),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arfoon Note',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Think, Note, Achieve.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const VerticalSpacer(space: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  HomeView(getNotes: (filter) async {
                    return api.notes.list();
                  });
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: const Text('All Notes'),
                  leading: SvgPicture.asset(
                    AppAssets.allNotes,
                    height: 22,
                    width: 22,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 22,
                  ),
                ),
              ),
              const VerticalSpacer(space: 20),
              const Text('Labels'),
              const VerticalSpacer(space: 10),
              Column(
                children: [
                  for (var label in FakeData().menuTitles) ...{
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      style: ListTileStyle.list,
                      tileColor: Colors.white,
                      title: Text(label),
                      leading: SvgPicture.asset(
                        AppAssets.label,
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                      trailing: SvgPicture.asset(
                        AppAssets.edit,
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                    ),
                    const VerticalSpacer(space: 10),
                  }
                ],
              ),
              const VerticalSpacer(space: 50),
              if (widget.onNewLabel == null)
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: const Text('Add Label'),
                  leading: SvgPicture.asset(
                    AppAssets.addLabel,
                    height: 22,
                    width: 22,
                    color: Colors.black,
                  ),
                  onTap: () {
                    AddEditLabelDialog(
                      onSubmit: (label) async {
                        await Future.delayed(const Duration(seconds: 1));
                        // Navigator.pop(context);
                        if (kDebugMode) {
                          print(label);
                        }
                      },
                    ).show(context: context);
                    widget.onNewLabel?.call().then((v) {
                      //todo: if save label then get labels form db
                    });
                  },
                ),
              const VerticalSpacer(space: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                style: ListTileStyle.list,
                tileColor: Colors.white,
                title: const Text('settings'),
                leading: SvgPicture.asset(
                  AppAssets.settings,
                  height: 22,
                  width: 22,
                  color: Colors.black,
                ),
                onTap: () {
                  const OpenSettingsDialog().show(context: context);
                },
              ),
              const VerticalSpacer(space: 10),
              GestureDetector(
                onTap: () {
                  AddProfileLabelDialog(onSubmit: (label) async {})
                      .show(context: context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.profile,
                      height: 33,
                      width: 33,
                    ),
                    const HorizontalSpacer(space: 10),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abdul Rahman Popal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    const HorizontalSpacer(space: 50),
                    SvgPicture.asset(AppAssets.dropdown),
                  ],
                ),
              ),
              const VerticalSpacer(space: 30),
            ],
          ),
        ),
      ),
    );
  }
}
