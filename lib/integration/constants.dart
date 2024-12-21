import 'package:arfoon_note/client/client.dart';
import 'package:arfoon_note/integration/integration.dart';

late NoteServer api;

initApi() async {
  //todo: add path_provider
  // final dir = await getApplicationDocumentsDirectory();
  api = NoteServer.instance(await openIsar('dir'));
}
