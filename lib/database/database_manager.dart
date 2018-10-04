import 'package:countdown/models/data_model.dart';
import 'package:countdown/services/store.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IDatabaseManager {
  Future<void> setup(); //!fonksiyon isimleri keyfen girilebilir
  Future<void> clear();
}

@immutable //! Sınıf değişmezdir, yani özellikleri değişemez; tüm özellikler nihai olmalıdır.
final class DatabaseManager implements IDatabaseManager {
  @override
  Future<void> setup() async {
    await _open();
    final DatabaseManager databaseManager = DatabaseManager();
    databaseManager._initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk(); //! açılmış hiveları siler
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
