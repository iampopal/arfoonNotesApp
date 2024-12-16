import 'package:arfoon_note/client/client.dart';

class FakeData {
  final notes = [
    Note(
      title: 'Halo',
      labelIds: [],
    ),
    Note(
      title: 'Halo 2',
      labelIds: [],
    )
  ];
  List<Map<String, dynamic>> filters = [
    {'title': 'All Notes'},
    {'title': 'Home'},
    {'title': 'Office'},
    {'title': 'Note'},
    {'title': 'Office'}
  ];

  List<Map<String, dynamic>> fakeNotes = [
    {
      'date': '12 Sep',
      'title': 'Exploring Ideas',
      'pinned': 'true',
      'note':
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...',
      'techs': ['office']
    },
    {
      'date': '12 Sep',
      'title': 'Exploring Ideas',
      'pinned': 'false',
      'note':
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...',
      'techs': ['office', 'Design']
    },
    {
      'date': '12 Sep',
      'title': 'Exploring Ideas',
      'pinned': 'false',
      'note':
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...',
      'techs': ['office', 'Design']
    }
  ];

  List<String> menuTitles = ['Office', 'Home', 'Design', 'Code', 'To Learn'];

  List<Map<String, dynamic>> examplesData = [
    {
      'index': '0',
      'title': 'HomeExample',
      'subtitle':
          'Push to HomeExample screen and returns examples HomeView with calls of '
              'getFiles(file), getLabels(), addNotes, onSettingTap, onProfileTap'
    },
    {
      'index': '1',
      'title': 'ProfileView',
      'subtitle':
          'This is a dialog and show as ProfileView().show(context) and has parameters of: title, submitText, onSubmit(s)'
    },
    {
      'index': '2',
      'title': 'SettingsView',
      'subtitle':
          'This is a dialog and show as SettingsView().show(context) and has parameters of currentLanguage, onLanguageChanged(llang), currentTheme, onThemeChanged(t)'
    },
    {
      'index': '3',
      'title': 'AddEditLabelView',
      'subtitle':
          'This is a dialog and show as AddEditLabelView().show(context) and has parameters of: title, onSubmit(s), onDelete'
    },
    {
      'index': '4',
      'title': 'SureView',
      'subtitle':
          'This is a dialog and show as SureView().show(context) and has parameters of: title, subtitle, sureText, onSure()'
    }
  ];
}
