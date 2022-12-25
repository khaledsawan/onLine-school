class NotifiModel {
  String? to;
  String? priority;
  NotificationBody? notificationBody;
  DataNotifi? data;

  NotifiModel({this.to, this.priority, this.notificationBody, this.data});

  NotifiModel.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    priority = json['priority'];
    notificationBody = json['notification'] != null
        ?  NotificationBody.fromJson(json['notification'])
        : null;
    data = json['data'] != null ?  DataNotifi.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['to'] = this.to;
    data['priority'] = this.priority;
    if (this.notificationBody != null) {
      data['notification'] = this.notificationBody!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NotificationBody {
  String? title;
  String? body;

  NotificationBody({this.title, this.body});

  NotificationBody.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class DataNotifi {
  String? image;
  int? teacher_id;

  DataNotifi({this.image,this.teacher_id});

  DataNotifi.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    teacher_id = json['teacher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['image'] = this.image;
    data['teacher_id'] = this.teacher_id;
    return data;
  }
}