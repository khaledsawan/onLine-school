class AdminStudentIndexModel {
  bool? success;
  List<StudentIndex>? studentIndex;

  AdminStudentIndexModel({this.success, this.studentIndex});

  AdminStudentIndexModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['studentIndex'] != null) {
      studentIndex = <StudentIndex>[];
      json['studentIndex'].forEach((v) {
        studentIndex!.add( StudentIndex.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.studentIndex != null) {
      data['studentIndex'] = this.studentIndex!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentIndex {
  int? id;
  String? package;
  String? firstName;
  String? lastName;
  String? email;

  StudentIndex(
      {this.id, this.package, this.firstName, this.lastName, this.email});

  StudentIndex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package = json['package'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['package'] = this.package;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}