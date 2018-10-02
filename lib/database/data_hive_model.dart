import 'package:countdown/database/hive_model_mixin.dart';
import 'package:countdown/models/data_model.dart';

class DataHiveModel with HiveModelMixin<DataHiveModel> {
  //! mixinde key class adı olarak belirleniyor
  DataHiveModel({
    required this.dataModel,
  });
  final DataModel dataModel;
}
