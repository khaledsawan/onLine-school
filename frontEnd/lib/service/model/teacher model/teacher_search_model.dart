class TeacherSearchModel {
  bool? success;
  String? message;
  List<SearchData>? data;

  TeacherSearchModel({this.success, this.message, this.data});

  TeacherSearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SearchData>[];
      json['data'].forEach((v) {
        data!.add( SearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchData {
  String? img;
  String? name;
  int? id;

  SearchData({this.img, this.name, this.id});

  SearchData.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = this.img;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
