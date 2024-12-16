import 'package:isar/isar.dart';

import 'package:arfoon_note/client/client.dart';

class Notes {
  final Isar isar;
  const Notes({required this.isar});

  Future<Note> insert(Note note) async {
    var res = await isar.writeTxn(() async {
      return await isar.notes.put(note);
    });
    return note.copyWith(id: res);
  }

  Future<List<Note>> list({Pagination? pagination}) async {
    if (pagination != null) {
      return await isar.notes
          .where()
          .offset(pagination.offset)
          .limit(pagination.limit)
          .findAll();
    }

    return await isar.notes.where().findAll();
  }

  Future<Note?> get(int id) async {
    return await isar.notes.get(id);
  }

  Future<Note?> updateLabel(Note note) async {
    var res = await isar.writeTxn(() async {
      return await isar.notes.put(note);
    });
    return note.copyWith(id: res);
  }

  Future deleteLabel(int id) async {
    await isar.writeTxn(() async {
      return await isar.notes.delete(id);
    });
  }
}
