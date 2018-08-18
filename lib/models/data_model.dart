class DataModel {
  String? title;
  String? date;

  DataModel({this.title, this.date});

  DataModel.fromJson(Map<String, dynamic> json) {
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
