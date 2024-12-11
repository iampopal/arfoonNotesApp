// ignore_for_file: file_names

class AppData {
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
      'subtitle': 'Push to HomeExample screen and returns examples '
          'HomeView with calls of getFiles(file), getLabels(), addNotes, onSettingTap, onProfileTap'
    },
    {
      'index': '2',
      'title': 'SettingsView',
      'subtitle': 'Push to HomeExample screen and returns examples '
          'HomeView with calls of getFiles(file), getLabels(), addNotes, onSettingTap, onProfileTap'
    },
    {
      'index': '3',
      'title': 'AddEditLabelView',
      'subtitle': 'Push to HomeExample screen and returns examples '
          'HomeView with calls of getFiles(file), getLabels(), addNotes, onSettingTap, onProfileTap'
    },
    {
      'index': '4',
      'title': 'SureView',
      'subtitle': 'Push to HomeExample screen and returns examples '
          'HomeView with calls of getFiles(file), getLabels(), addNotes, onSettingTap, onProfileTap'
    }
  ];

  List<Map<String, dynamic>> notes = [
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

  List<Map<String, dynamic>> filters = [
    {'title': 'All Notes'},
    {'title': 'Home'},
    {'title': 'Office'},
    {'title': 'Note'},
    {'title': 'Office'}
  ];
}
