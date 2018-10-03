import 'package:countdown/database/hive_data_model_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../database/hive_types.dart';
part 'data_model.g.dart';

@HiveType(
    typeId: HiveTypes
        .dataModelId) //! DataModel için typeId belirledik bu HiveTypes clasında elle yazdık yeni bir model için orada yine belirlemek gerek
class DataModel with HiveDataModelMixin {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? date;
  @HiveField(3)
  bool? isComplete;

  DataModel({this.id, this.title, this.date, this.isComplete});

//! burası hive data model mixinden geliyor
  @override
  // TODO: implement key
  String get key {
    var uuid = Uuid().toString();
    return uuid;
  }

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['isComplete'] = this.isComplete;
    return data;
  }
}
