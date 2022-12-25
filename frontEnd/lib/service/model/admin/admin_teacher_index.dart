class AdminTeacherIndex {
  bool? success;
  List<Data>? data;

  AdminTeacherIndex({this.success, this.data});

  AdminTeacherIndex.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? img;
  String? firstName;
  String? lastName;

  Data({this.id, this.img, this.firstName, this.lastName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['img'] = this.img;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}