class AdminStudentProfileModel {
  bool? success;
  Student? student;
  UserStudent? userStudent;

  AdminStudentProfileModel({this.success, this.student, this.userStudent});

  AdminStudentProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    student =
    json['student'] != null ?  Student.fromJson(json['student']) : null;
    userStudent = json['userStudent'] != null
        ?  UserStudent.fromJson(json['userStudent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    if (this.userStudent != null) {
      data['userStudent'] = this.userStudent!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? package;
  String? telegram;
  String? dio;
  int? phone;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
        this.package,
        this.telegram,
        this.dio,
        this.phone,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package = json['package'];
    telegram = json['telegram'];
    dio = json['dio'];
    phone = json['phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['package'] = this.package;
    data['telegram'] = this.telegram;
    data['dio'] = this.dio;
    data['phone'] = this.phone;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserStudent {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserStudent(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.role,
        this.createdAt,
        this.updatedAt});

  UserStudent.fromJson(Map<String, dynamic> json) {
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