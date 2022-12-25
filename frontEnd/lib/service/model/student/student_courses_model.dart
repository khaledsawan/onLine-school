class StudentCoursesModel {
  bool? success;
  String? message;
  List<Courses>? courses;

  StudentCoursesModel({this.success, this.message, this.courses});

  StudentCoursesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add( Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  String? img;
  String? name;
  int? id;
  String? category;
  int? viewerQuntity;
  int? numberOfVideos;
  int? teacherId;
  String? teacherImage;

  Courses(
      {this.img,
        this.name,
        this.id,
        this.category,
        this.viewerQuntity,
        this.numberOfVideos,
        this.teacherId,
        this.teacherImage});

  Courses.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
    category = json['category'];
    viewerQuntity = json['viewer_quntity'];
    numberOfVideos = json['number_of_videos'];
    teacherId = json['teacher_id'];
    teacherImage = json['teacherImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['img'] = this.img;
    data['name'] = this.name;
    data['id'] = this.id;
    data['category'] = this.category;
    data['viewer_quntity'] = this.viewerQuntity;
    data['number_of_videos'] = this.numberOfVideos;
    data['teacher_id'] = this.teacherId;
    data['teacherImage'] = this.teacherImage;
    return data;
  }
}