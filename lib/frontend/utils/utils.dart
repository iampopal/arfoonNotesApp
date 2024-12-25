import 'package:flutter/material.dart';

class Utils {
  List<DropdownMenuItem<String>> get languageDropDownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "en", child: Text("Englis")),
      DropdownMenuItem(value: "ps", child: Text("پښتو")),
      DropdownMenuItem(value: "fa", child: Text("دری")),
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
