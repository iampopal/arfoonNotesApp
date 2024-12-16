import 'package:arfoon_note/server/server.dart';
import 'package:isar/isar.dart';

class NoteServer {
  final Labels labels;
  final Notes notes;
  final Isar isar;
  const NoteServer(this.isar, {required this.labels, required this.notes});
  static NoteServer instance(Isar isar) {
    return NoteServer(
      isar,
      labels: Labels(isar: isar),
      notes: Notes(isar: isar),
    );
  }
}
