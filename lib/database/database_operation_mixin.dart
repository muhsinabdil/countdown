import 'package:countdown/database/hive_model_mixin.dart';

mixin DatabaseOperationMixin<T extends HiveModelMixin<T>> {
  //! hiveModel Mixin verme sebebi önüne gelen class veremesin
  final String key = T.toString();

  Future<void> addData(Map<String, dynamic> data) async {
    await Hive.box(key).add(data);
  }

  Future<void> deleteData(int index) async {
    await Hive.box(key).deleteAt(index);
  }

  Future<void> updateData(int index, Map<String, dynamic> data) async {
    await Hive.box(key).putAt(index, data);
  }

  Future<void> clearData() async {
    await Hive.box(key).clear();
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final List<Map<String, dynamic>> data = [];
    for (int i = 0; i < Hive.box(key).length; i++) {
      data.add(Hive.box(key).getAt(i));
    }
    return data;
  }
}
