import 'package:countdown/database/hive_manager_mixin.dart';
import 'package:countdown/database/hive_model_mixin.dart';
import 'package:hive/hive.dart';

//! T type hivemodelmixin tipinde dediğimizde bunun key gücü var bunu biliyoruz
class HiveDatabaseOperation<T extends HiveModelMixin> with HiveManagerMixin<T> {
  //! hiveModel Mixin verme sebebi önüne gelen class veremesin
//!bu yapıyı mixin içine taşıdık her operation için bu olacağı için
/*   late Box<T> _box;
  Future<void> start() async {
    _box = await Hive.openBox<T>(key); //! bu key mixin ile oluşuyor
  } */

  Future<void> stop() async {
    await box.close();
  }

  Future<void> clear() async {
    await box.clear();
  }

  Future<void> delete(T model) async {
    await box.delete(model);
  }

  Future<void> add(T model) async {
    await box.put(model.key,
        model); //! T type HiveModelMixin Olduğu için modelde key geliyor
  }
}
