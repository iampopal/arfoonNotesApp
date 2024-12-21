import 'package:isar/isar.dart';

part 'note.g.dart';

@collection
class Note {
  Id? id = Isar.autoIncrement;
  String? date;
  bool? pinned;
  String? title;
  String? details;
  int? colorId;
  List<int> labelIds;
  List<String>? techs;

  Note({
    this.id,
    this.title,
    this.details,
    this.colorId,
    this.date,
    this.pinned,
    this.techs,
    required this.labelIds,
  });

  Note copyWith({
    Id? id,
    String? date,
    bool? pinned,
    String? title,
    String? details,
    int? colorId,
    List<int>? labelIds,
    List<String>? techs,
  }) {
    return Note(
      id: id ?? this.id,
      date: date ?? this.date,
      pinned: pinned ?? this.pinned,
      title: title ?? this.title,
      details: details ?? this.details,
      colorId: colorId ?? this.colorId,
      labelIds: labelIds ?? this.labelIds,
      techs: techs ?? this.techs,
    );
  }
}
