import 'package:countdown/models/db.dart';
import 'package:countdown/services/store.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInjector {
  static Future<void> setup() async {
    await Hive.initFlutter();
    _registerAdapters();
    await Hive.openBox(Store.storeBox); //!
  }

  static void _registerAdapters() {
    Hive.registerAdapter(DBAdapter()); //! db.g.dart içinden geliyor
  }
}
