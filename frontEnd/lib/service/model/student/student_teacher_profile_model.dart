class StudentTeacherProfileModel {
  bool? success;
  Teacher? teacher;
  Userteacher? userteacher;
  List<TeacherCourses>? teacherCourses;

  StudentTeacherProfileModel(
      {this.success, this.teacher, this.userteacher, this.teacherCourses});

  StudentTeacherProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teacher =
    json['teacher'] != null ?  Teacher.fromJson(json['teacher']) : null;
    userteacher = json['userteacher'] != null
        ?  Userteacher.fromJson(json['userteacher'])
        : null;
    if (json['teacherCourses'] != null) {
      teacherCourses = <TeacherCourses>[];
      json['teacherCourses'].forEach((v) {
        teacherCourses!.add( TeacherCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.userteacher != null) {
      data['userteacher'] = this.userteacher!.toJson();
    }
    if (this.teacherCourses != null) {
      data['teacherCourses'] =
          this.teacherCourses!.map((v) => v.toJson()).toList();
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

class Userteacher {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  Userteacher(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.role,
        this.createdAt,
        this.updatedAt});

  Userteacher.fromJson(Map<String, dynamic> json) {
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

class TeacherCourses {
  String? name;
  int? id;
  String? img;

  TeacherCourses({this.name, this.id, this.img});

  TeacherCourses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = this.name;
    data['id'] = this.id;
    data['img'] = this.img;
    return data;
  }
}