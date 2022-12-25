class TeacherCoursesModel {
  bool? _success;
  String? _message;
  List<Data>? _data;

  TeacherCoursesModel({bool? success, String? message, List<Data>? data}) {
    if (success != null) {
      _success = success;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  TeacherCoursesModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _name;
  String? _img;
  int? _id;

  Data({String? name, String? img, int? id}) {
    if (name != null) {
      _name = name;
    }
    if (img != null) {
      _img = img;
    }
    if (id != null) {
     _id = id;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get img => _img;
  set img(String? img) => _img = img;
  int? get id => _id;
  set id(int? id) => _id = id;

  Data.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _img = json['img'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] =_name;
    data['img'] = _img;
    data['id'] = _id;
    return data;
  }
}