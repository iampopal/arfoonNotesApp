import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/frontend/components/VertialSpacer.dart';
import 'package:flutter/material.dart';

class AddEditLabelDialog extends StatefulWidget {
  const AddEditLabelDialog({
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
  State<AddEditLabelDialog> createState() => _AddEditLabelDialogState();
}

class _AddEditLabelDialogState extends State<AddEditLabelDialog> {
  TextEditingController controller = TextEditingController();
  bool loading = false;
  String? error;

  Label get currentLabel {
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('New Label'),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      children: [
        const Text('Label Name'),
        const VerticalSpacer(space: 5),
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          height: 55,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                gapPadding: 10,
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText: 'Create Label Name',
            ),
          ),
        ),
        if (error != null) Text('Error: $error'),
        const VerticalSpacer(space: 10),
        Row(
          children: [
            if (widget.label != null && widget.onDelete != null)
              ElevatedButton(
                onPressed: () {
                  widget.onDelete?.call(currentLabel);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white70),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                child: const Text('Delete'),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                try {
                  setState(() {
                    error = null;
                    loading = true;
                  });
                  await widget.onSubmit(currentLabel);
                  if (context.mounted) Navigator.pop(context);
                } catch (e) {
                  error = e.toString();
                } finally {
                  setState(() {
                    loading = false;
                  });
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
                  : const Text('Save Label'),
            ),
          ],
        ),
        const VerticalSpacer(space: 15),
      ],
    );
  }
}
