import 'package:arfoon_note/frontend/data/fake_data.dart';
import 'package:arfoon_note/frontend/features/home/home_view.dart';
import 'package:arfoon_note/frontend/utils/add_edit_label_dialog.dart';
import 'package:flutter/widgets.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  int notes = 0;
  @override
  Widget build(BuildContext context) {
    return HomeView(
      getLabels: () async {
        await Future.delayed(const Duration(milliseconds: 2));
        return FakeData().labels;
      },
      getNotes: (filter, isSearchedByLabel) async {
        await Future.delayed(const Duration(seconds: 2));
        if (notes == 0) {
          notes++;
          throw 'Something error like from example';
        }
        if (notes == 1) {
          notes++;
          return [];
        }
        if ((filter.search ?? '').isNotEmpty && !isSearchedByLabel) {
          var list = FakeData()
              .notes
              .where((e) =>
                  e.title!.toLowerCase().contains(filter.search!.toLowerCase()))
              .toList();
          return list;
        }
        if ((filter.search ?? '').isNotEmpty && isSearchedByLabel) {
          var list = FakeData()
              .notes
              .where((e) => e.techs!.contains(filter.search))
              .toList();
          return list;
        }
        return FakeData().notes;
      },
      onNewLabel: () async {
        AddEditLabelDialog(
          onSubmit: (l) async {},
        ).show(context: context);
        return null;
      },
    );
  }
}
