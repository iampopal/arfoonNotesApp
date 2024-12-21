import 'package:arfoon_note/frontend/components/HorizontalSpacer.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:flutter/material.dart';

class OpenDeleteLabelDialog extends StatefulWidget {
  const OpenDeleteLabelDialog({super.key});

  @override
  State<OpenDeleteLabelDialog> createState() => _OpenDeleteLabelDialogState();
}

class _OpenDeleteLabelDialogState extends State<OpenDeleteLabelDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
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
                  backgroundColor: WidgetStateProperty.all(Colors.white70),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                child: const Text('Cancel'),
              ),
              const HorizontalSpacer(space: 10),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
          const VerticalSpacer(space: 20),
        ]);
  }
}
