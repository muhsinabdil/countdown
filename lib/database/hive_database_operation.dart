import 'package:countdown/database/hive_model_mixin.dart';
import 'package:hive/hive.dart';

class HiveDatabaseOperation<T> with HiveModelMixin<T> {
  //! hiveModel Mixin verme sebebi önüne gelen class veremesin
  late Box<T> _box;
  Future<void> start() async {
    _box = await Hive.openBox<T>(key); //! bu key mixin ile oluşuyor
  }

  Future<void> stop() async {
    await _box.close();
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> delete(T data) async {
    await _box.delete(data);
  }

  Future<void> add(T data) async {
    await _box.add(data);
  }
}
