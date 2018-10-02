import 'package:countdown/models/data_model.dart';

import '../services/store.dart';

class NoteController {
  late final Store store;

  NoteController() {
    store = Store();
  }

  Future<List<DBModel>?> getNotes() async {
    var data = await store.getValue(Store.notes);

    if (data != null) {
      return List<DBModel>.from(data);
    }

    return null;
  }

  Future<void> addNote(DBModel db) async {
    final List<DBModel> notes =
        List<DBModel>.from(await store.getValue(Store.notes) ?? []);
    notes.add(db);
    await store.setValue(Store.notes, value: notes);
  }

  Future<void> deleteNote(DBModel db) async {
    final List<DBModel> notes =
        List<DBModel>.from(await store.getValue(Store.notes) ?? []);
    notes.remove(db);
    await store.setValue(Store.notes, value: notes);
  }
}
