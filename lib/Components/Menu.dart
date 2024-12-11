// ignore_for_file: file_names

import 'package:afroon_test_project/AppData/appData.dart';
import 'package:afroon_test_project/Helpers/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Space/HorizontalSpacer.dart';
import 'Space/VerticalSpacer.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
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
                ListTile(
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
                const VerticalSpacer(space: 20),
                const Text('Labels'),
                const VerticalSpacer(space: 10),
                Column(
                  children: [
                    for (var label in AppData().menuTitles) ...{
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
                    openAddLabelDialog(context: context);
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
                    openSettingsDialog(context: context);
                  },
                ),
                const VerticalSpacer(space: 10),
                GestureDetector(
                  onTap: () {
                    openProfileDialog(context: context);
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
      ),
    );
  }
}

openAddLabelDialog({required context}) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text('New Label'),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      children: [
        const Text('Label Name'),
        const VerticalSpacer(space: 5),
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          height: 55,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                gapPadding: 10,
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText: 'Create Label Name',
            ),
          ),
        ),
        const VerticalSpacer(space: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                openDeleteLabelDialog(context: context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white70),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              child: const Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              child: const Text('Save Label'),
            ),
          ],
        ),
        const VerticalSpacer(space: 15),
      ],
    ),
  );
}

openDeleteLabelDialog({required context}) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
        title: const Text('are you sure want to delete?'),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        children: [
          const VerticalSpacer(space: 10),
          const Text(
              'Once you delete a label you wont be able to undo, are you sure to delete?'),
          const VerticalSpacer(space: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                child: const Text('Cancel'),
              ),
              const HorizontalSpacer(space: 10),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
          const VerticalSpacer(space: 20),
        ]),
  );
}

openProfileDialog({required context}) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        children: [
          const VerticalSpacer(space: 10),
          SvgPicture.asset(
            AppAssets.logo,
            height: 80,
            width: 80,
          ),
          const VerticalSpacer(space: 20),
          const Text(
            textAlign: TextAlign.center,
            'Welcome to Arfoon Note',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const VerticalSpacer(space: 20),
          const Text('Full Name'),
          const VerticalSpacer(space: 5),
          SizedBox(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  // gapPadding: 5,
                ),
                hintText: 'Full Name',
              ),
            ),
          ),
          const VerticalSpacer(space: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              child: const Text('Continue'),
            ),
          ),
          const VerticalSpacer(space: 30),
          const Text(
              textAlign: TextAlign.center,
              'By using X note you agree to Terms of Services and Privacy Policy'),
          const VerticalSpacer(space: 10),
        ]),
  );
}

openSettingsDialog({required context}) {
  String? languageValue = 'English';
  String? themeValue = 'System Theme';
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.settings,
              height: 60,
              width: 60,
            ),
            const Text(
              'Arfoon Notes Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        children: [
          const VerticalSpacer(space: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Change Language'),
              const VerticalSpacer(space: 10),
              DropdownButtonFormField<String>(
                items: languageDropDownItems,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Rubik',
                ),
                elevation: 24,
                iconEnabledColor: Colors.black,
                isDense: true,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5, top: 3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  //border: OutlineInputBorder(),
                ),
                iconSize: 20,
                onChanged: (value) {
                  languageValue = value;
                },
                onSaved: (newValue) {
                  languageValue = newValue;
                },
                value: languageValue,
              ),
              const VerticalSpacer(space: 10),
              const Text('Change Theme'),
              const VerticalSpacer(space: 10),
              DropdownButtonFormField<String>(
                items: themeDropDownItems,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Rubik',
                ),
                elevation: 24,
                iconEnabledColor: Colors.black,
                isDense: true,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5, top: 3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  //border: OutlineInputBorder(),
                ),
                iconSize: 20,
                onChanged: (value) {
                  themeValue = value;
                },
                onSaved: (newValue) {
                  themeValue = newValue;
                },
                value: themeValue,
              ),
            ],
          ),
          const VerticalSpacer(space: 20),
        ]),
  );
}

List<DropdownMenuItem<String>> get languageDropDownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "English", child: Text("Englis")),
    DropdownMenuItem(value: "Pashto", child: Text("Pashto")),
    DropdownMenuItem(value: "Dari", child: Text("Dari")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get themeDropDownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "System Theme", child: Text("System Theme")),
    DropdownMenuItem(value: "Dark", child: Text("Dark")),
    DropdownMenuItem(value: "Light", child: Text("Light")),
  ];
  return menuItems;
}
