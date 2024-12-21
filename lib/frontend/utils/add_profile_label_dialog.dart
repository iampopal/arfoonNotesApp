import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:arfoon_note/frontend/helpers/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddProfileLabelDialog extends StatefulWidget {
  const AddProfileLabelDialog({
    super.key,
    this.label,
    required this.onSubmit,
    this.onDelete,
  });

  final Label? label;
  final Future Function(Label label) onSubmit;
  final Function(Label label)? onDelete;

  Future show({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  State<AddProfileLabelDialog> createState() => _AddProfileLabelDialogState();
}

class _AddProfileLabelDialogState extends State<AddProfileLabelDialog> {
  TextEditingController controller = TextEditingController();
  bool loading = false;
  String? error;

  Label get currentProfileLabel {
    return Label(
      id: widget.label?.id,
      name: controller.text,
    );
  }

  @override
  void initState() {
    controller.text = widget.label?.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
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
              onPressed: () async {
                try {
                  setState(() {
                    error = null;
                    loading = true;
                  });
                  await widget.onSubmit(currentProfileLabel);
                  if (context.mounted) Navigator.pop(context);
                } catch (e) {
                  error = e.toString();
                } finally {
                  loading = false;
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              child: loading
                  ? const SizedBox(
                      height: 20,
                      width: 40,
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      )),
                    )
                  : const Text('Continue'),
            ),
          ),
          const VerticalSpacer(space: 30),
          const Text(
              textAlign: TextAlign.center,
              'By using X note you agree to Terms of Services and Privacy Policy'),
          const VerticalSpacer(space: 10),
        ]);
  }
}
