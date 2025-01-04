import 'package:arfoon_note/frontend/frontend.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:arfoon_note/integration/constants.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView(
      getLabels: () async {
        return api.labels.list();
      },
      getNotes: (filter, isSearchedByLabel) async {
        return api.notes.list();
      },
      onNewLabel: () async {
        AddEditLabelDialog(
          onSubmit: (l) async {
            return api.labels.insert(l);
          },
        ).show(context: context);
        return null;
      },
    ); // return const HomeView();
  }
}
