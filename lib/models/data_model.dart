import 'package:countdown/database/hive_model_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../database/hive_types.dart';
part 'data_model.g.dart';

@HiveType(
    typeId: HiveTypes
        .dataModelId) //! DataModel için typeId belirledik bu HiveTypes clasında elle yazdık yeni bir model için orada yine belirlemek gerek
class DataModel with HiveModelMixin {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? date;
  @HiveField(2)
  bool? isComplete;
  @HiveField(3)
  bool? isActive;

  DataModel({this.title, this.date, this.isComplete, this.isActive});

//! burası hive  model mixinden geliyor
  @override
  //! model uniq key
  String get key {
    var uuid = Uuid();
    return uuid.v1();
  }

  @override
  int get id => this.id;

  @override
  set id(int value) {
    this.id = value;
  }

  DataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    isComplete = json['isComplete'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['date'] = this.date;
    data['isComplete'] = this.isComplete;
    data['isActive'] = this.isActive;
    return data;
  }
}
