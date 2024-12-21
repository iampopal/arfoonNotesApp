import 'package:flutter/material.dart';

class Utils {
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
}
