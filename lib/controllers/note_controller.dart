import 'package:countdown/models/db.dart';

import '../services/store.dart';

class NoteController {
  late final Store store;

  NoteController() {
    store = Store();
  }

  Future<List<DB>?> getNotes() async =>
      List<DB>.from(await store.getValue(Store.notes));

  Future<void> addNote(DB db) async {
    final List<DB> notes =
        List<DB>.from(await store.getValue(Store.notes) ?? []);
    notes.add(db);
    await store.setValue(Store.notes, notes);
  }

  Future<void> deleteNote(DB db) async {
    final List<DB> notes =
        List<DB>.from(await store.getValue(Store.notes) ?? []);
    notes.remove(db);
    await store.setValue(Store.notes, notes);
  }
}
