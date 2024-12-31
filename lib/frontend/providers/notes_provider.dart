import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier {
  TextEditingController selectedNoteTitle = TextEditingController();
  TextEditingController selectedNoteDescription = TextEditingController();

  void selectNote(String noteTitle, String noteDescription) {
    selectedNoteTitle.text = noteTitle;
    selectedNoteDescription.text = noteDescription;
    notifyListeners();
  }
}
