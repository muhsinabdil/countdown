import 'package:hive/hive.dart';

part 'db.g.dart';

@HiveType(typeId: 0)
class DB {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? date;

  DB({this.title, this.date});

  DB.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    return data;
  }
}
