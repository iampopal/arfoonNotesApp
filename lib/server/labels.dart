import 'package:isar/isar.dart';

import 'package:arfoon_note/client/client.dart';

class Labels {
  final Isar isar;
  const Labels({
    required this.isar,
  });

  Future<Label> insert(Label label) async {
    var res = await isar.writeTxn(() async {
      return await isar.labels.put(label);
    });
    return label.copyWith(id: res);
  }

  Future<List<Label>> list({Pagination? pagination}) async {
    if (pagination != null) {
      return await isar.labels
          .where()
          .offset(pagination.offset)
          .limit(pagination.limit)
          .findAll();
    }

    return await isar.labels.where().findAll();
  }

  Future<Label?> get(int id) async {
    return await isar.labels.get(id);
  }

  Future<Label?> updateLabel(Label label) async {
    var res = await isar.writeTxn(() async {
      return await isar.labels.put(label);
    });
    return label.copyWith(id: res);
  }

  Future deleteLabel(int id) async {
    await isar.writeTxn(() async {
      return await isar.labels.delete(id);
    });
  }
}
