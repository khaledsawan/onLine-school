class AdminStudentSearchModel {
  bool? success;
  List<Students>? students;

  AdminStudentSearchModel({this.success, this.students});

  AdminStudentSearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add( Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? email;
  String? firstName;
  String? lastName;

  Students({this.id, this.email, this.firstName, this.lastName});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}