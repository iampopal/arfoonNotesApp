import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/client/models/examples_data.dart';

class FakeData {
  final notes = [
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas ahmad',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office'],
      pinned: true,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas mahmood',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Design'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Home'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Note'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office'],
      pinned: true,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office'],
      pinned: true,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Home'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Home'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Home'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Home'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office', 'Home'],
      pinned: false,
      labelIds: [],
    ),
    Note(
      date: '12 Sep',
      title: 'Exploring Ideas',
      details:
          'Exploring Ideas is the cornerstone of innovation and progress its the process of venturing beyond the familiar, questioning assumption, and mbrace...techs',
      techs: ['Office'],
      pinned: false,
      labelIds: [],
    ),
  ];

  final labels = [
    Label(name: 'All Notes'),
    Label(name: 'Home'),
    Label(name: 'Office'),
    Label(name: 'Note'),
    Label(name: 'Design'),
  ];

  List<String> menuTitles = ['Office', 'Home', 'Design', 'Code', 'To Learn'];

  final examplesData = [
    const ExamplesData(
      title: 'HomeExample',
      subTitle:
          'Push to HomeExample screen and returns examples HomeView with calls of '
          'getFiles(file), getLabels(), addNotes, onSettingTap, onProfileTap',
    ),
    const ExamplesData(
      title: 'ProfileView',
      subTitle:
          'This is a dialog and show as ProfileView().show(context) and has parameters of: title, submitText, onSubmit(s)',
    ),
    const ExamplesData(
      title: 'SettingsView',
      subTitle:
          'This is a dialog and show as SettingsView().show(context) and has parameters of currentLanguage, onLanguageChanged(llang), currentTheme, onThemeChanged(t)',
    ),
    const ExamplesData(
      title: 'AddEditLabelView',
      subTitle:
          'This is a dialog and show as AddEditLabelView().show(context) and has parameters of: title, onSubmit(s), onDelete',
    ),
    const ExamplesData(
      title: 'SureView',
      subTitle:
          'This is a dialog and show as SureView().show(context) and has parameters of: title, subtitle, sureText, onSure()',
    ),
  ];
}
