class AdminTeacherSearchList {
  bool? success;
  List<Teachers>? teachers;

  AdminTeacherSearchList({this.success, this.teachers});

  AdminTeacherSearchList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add( Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  int? id;
  String? img;
  int? userId;
  String? firstName;
  String? lastName;

  Teachers({this.id, this.img, this.userId, this.firstName, this.lastName});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    userId = json['user_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['img'] = this.img;
    data['user_id'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}