import 'package:countdown/models/data_model.dart';
import 'package:countdown/services/store.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseManager {
  //!fonksiyon isimleri keyfen girilebilir
  static Future<void> start() async {
    await _open();
    final DatabaseManager databaseManager = DatabaseManager();
    databaseManager._initialOperation();
  }

  //!fonksiyon isimleri keyfen girilebilir     //! private yaptık
  static Future<void> _open() async {
    await Hive.initFlutter();
  }

//!fonksiyon isimleri keyfen girilebilir    //! private yaptık
  void _initialOperation() {
    Hive.registerAdapter(
        DataModelAdapter()); //! data_model.g.dart içinden geliyor class adı değişebilir
  }
}
