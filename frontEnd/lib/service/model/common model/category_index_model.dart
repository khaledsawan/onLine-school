class CategoryIndexModel {
  bool? _success;
  String? _message;
  List<Category>? _data;

  CategoryIndexModel({bool? success, String? message, List<Category>? data}) {
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
  List<Category>? get data => _data;
  set data(List<Category>? data) => _data = data;

  CategoryIndexModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Category>[];
      json['data'].forEach((v) {
        _data!.add( Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = _success;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? _name;
  int? _id;

  Category({String? name, int? id}) {
    if (name != null) {
      this._name = name;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  int? get id => _id;
  set id(int? id) => _id = id;

  Category.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['id'] = this._id;
    return data;
  }
}