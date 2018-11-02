
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_model_mixin.dart';

part 'hive_manager_mixin.dart';

//! T type hivemodelmixin tipinde dediğimizde bunun key gücü var bunu biliyoruz
class HiveDatabaseOperation<T extends HiveModelMixin> with HiveManagerMixin<T> {
  //! hiveModel Mixin verme sebebi önüne gelen class veremesin
//!bu yapıları mixin içine taşıdık her operation için bu olacağı için
/*   late Box<T> _box;
  Future<void> start() async {
    _box = await Hive.openBox<T>(key); //! bu key mixin ile oluşuyor
  } 
    Future<void> stop() async {
    await box.close();
  }

  Future<void> clear() async {
    await box.clear();
  }
  */

//! add ve update aynı yapıda olduğu için birleştirdik
  Future<void> addOrUpdateItem(T model) async {
    if (model.id == null) {
      model.id = getMaxId();
    }

    await _box.put(model.key,
        model); //! T type HiveModelMixin Olduğu için modelde key geliyor
  }

  T? getItem(String key) {
    //! T? tipi null olabilir demek
    //! kayıt boş dönebilir ama bunu kayıt esansında boş olmasını önlersek sıkıntı olmaz dolu olur.
    return _box.get(key);
  }

  Future<void> deleteItem(T model) => _box.delete(
      model); //! bu şekilde de tek satır yazarsak async ve await olamayabilir

  List<T> getAll() {
    var item = _box.values.toList();
    print(item);
    return item;
  }

  int getMaxId() {
    List<T> sortedList = _box.values.toList();
    sortedList.sort((a, b) => b.id.compareTo(a.id));
    return (sortedList.isNotEmpty ? sortedList.first.id : 0) + 1;
  }
}
