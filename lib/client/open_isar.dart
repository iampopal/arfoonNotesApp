
import 'package:isar/isar.dart';

import 'models/models.dart';

Future<Isar> openIsar(String dir) async {
  return await Isar.open(
    [
      LabelSchema,
      NoteSchema,
    ],
    directory: dir,
  );
}
