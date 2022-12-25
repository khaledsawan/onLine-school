class TeacherModel {
  bool? success;
  String? message;
  Teacher? teacher;
  User? user;

  TeacherModel({this.success, this.message, this.teacher, this.user});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    teacher =
    json['teacher'] != null ?  Teacher.fromJson(json['teacher']) : null;
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? img;
  String? telegram;
  String? dio;
  int? phone;
  int? viewerQuntity;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Teacher(
      {this.id,
        this.img,
        this.telegram,
        this.dio,
        this.phone,
        this.viewerQuntity,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    telegram = json['telegram'];
    dio = json['dio'];
    phone = json['phone'];
    viewerQuntity = json['viewer_quntity'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['img'] = this.img;
    data['telegram'] = this.telegram;
    data['dio'] = this.dio;
    data['phone'] = this.phone;
    data['viewer_quntity'] = this.viewerQuntity;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.role,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}