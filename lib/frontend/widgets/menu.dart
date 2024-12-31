// ignore_for_file: file_names
import 'dart:developer';

import 'package:arfoon_note/client/models/label.dart';
import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/add_profile_label_dialog.dart';
import 'package:arfoon_note/frontend/utils/open_settings_dialog.dart';
import 'package:arfoon_note/integration/constants.dart';
import 'package:arfoon_note/frontend/providers/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
    this.onNewLabel,
  });
  final Future<Label?> Function()? onNewLabel;
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Drawer(
          // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppAssets.logo,
                          height: 45,
                          width: 45,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const VerticalSpacer(space: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Locales.string(context, "arfoon_notes"),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            Locales.string(context, "think_note_achieve"),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              // color: Colors.black26,
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
                      HomeView(
                        getNotes: (filter, isSearchedByLabel) async {
                          return api.notes.list();
                        },
                        getLabels: (filter) async {
                          return api.labels.list();
                        },
                      );
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      style: ListTileStyle.list,
                      tileColor: Theme.of(context).colorScheme.primary,
                      title: Text(Locales.string(context, 'all_notes')),
                      leading: SvgPicture.asset(
                        AppAssets.allNotes,
                        height: 22,
                        width: 22,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 22,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const VerticalSpacer(space: 20),
                  Text(Locales.string(context, "labels")),
                  const VerticalSpacer(space: 10),
                  Column(
                    children: [
                      for (var label in FakeData().labels) ...{
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          style: ListTileStyle.list,
                          tileColor: Theme.of(context).primaryColor,
                          title: Text(label.name),
                          leading: SvgPicture.asset(
                            AppAssets.label,
                            height: 22,
                            width: 22,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.secondary,
                              BlendMode.srcIn,
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              AddEditLabelDialog(
                                onSubmit: (label) async {},
                                label: Label(name: label.name),
                              ).show(context: context);
                            },
                            child: SvgPicture.asset(
                              AppAssets.edit,
                              height: 22,
                              width: 22,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.secondary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpacer(space: 10),
                      }
                    ],
                  ),
                  const VerticalSpacer(space: 50),
                  // if (widget.onNewLabel == null)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    style: ListTileStyle.list,
                    tileColor: Theme.of(context).primaryColor,
                    title: Text(Locales.string(context, "add_label")),
                    leading: SvgPicture.asset(
                      AppAssets.addLabel,
                      height: 22,
                      width: 22,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () {
                      AddEditLabelDialog(
                        onSubmit: (label) async {
                          await Future.delayed(const Duration(seconds: 1));
                          // Navigator.pop(context);
                          if (kDebugMode) {
                            log('------->label =  ${label.name}');
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
                    tileColor: Theme.of(context).primaryColor,
                    title: Text(Locales.string(context, 'settings')),
                    leading: SvgPicture.asset(
                      AppAssets.settings,
                      height: 22,
                      width: 22,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () {
                      OpenSettingsDialog(
                        themeMode: themeProvider.currentTheme == AppTheme.dark
                            ? 'Dark'
                            : 'Light',
                        languageCode:
                            Locales.currentLocale(context)?.languageCode ??
                                "en",
                      ).show(context: context);
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Locales.string(context, "abdul_rahman_popal"),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              Locales.string(context, "good_morning"),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                // color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                        const HorizontalSpacer(space: 50),
                        SvgPicture.asset(
                          AppAssets.dropdown,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacer(space: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
