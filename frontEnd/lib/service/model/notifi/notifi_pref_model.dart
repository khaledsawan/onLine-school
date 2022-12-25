class NotifiPrefModel {
  String? title;
  String? body;
  String? image;
  int? teacher_id;

  NotifiPrefModel({this.title, this.body,this.teacher_id,this.image});

  NotifiPrefModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    image = json['image'];
    teacher_id = json['teacher_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  <String, dynamic>{};
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   data['image'] = this.image;
  //   data['teacher_id'] = this.teacher_id;
  //   return data;
  // }
}