class MotivationModel {
  int? id;
  String? languageCode;
  String? author;
  String? text;

  MotivationModel({this.id, this.languageCode, this.author, this.text});

  MotivationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['language_code'];
    author = json['author'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_code'] = this.languageCode;
    data['author'] = this.author;
    data['text'] = this.text;
    return data;
  }
}
