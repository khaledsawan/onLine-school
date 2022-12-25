class TeacherStoreCourseModel {
  bool? success;
  String? message;
  DataCourseStore? data;

  TeacherStoreCourseModel({this.success, this.message, this.data});

  TeacherStoreCourseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? DataCourseStore.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataCourseStore {
  int? teacherId;
  String? name;
  String? expectedTimeToFinsh;
  String? category;
  String? img;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataCourseStore(
      {this.teacherId,
        this.name,
        this.expectedTimeToFinsh,
        this.category,
        this.img,
        this.updatedAt,
        this.createdAt,
        this.id});

  DataCourseStore.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    name = json['name'];
    expectedTimeToFinsh = json['expected_time_to_finsh'];
    category = json['category'];
    img = json['img'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['name'] = name;
    data['expected_time_to_finsh'] = expectedTimeToFinsh;
    data['category'] = category;
    data['img'] = img;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}