class StudentCourseViewModel {
  bool? success;
  String? message;
  CourseStudent? courseStudent;
  List<VideosStudent>? videosStudent;
  TeacherInfo? teacherInfo;

  StudentCourseViewModel(
      {this.success,
        this.message,
        this.courseStudent,
        this.videosStudent,
        this.teacherInfo});

  StudentCourseViewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    courseStudent = json['courseStudent'] != null
        ?  CourseStudent.fromJson(json['courseStudent'])
        : null;
    if (json['videosStudent'] != null) {
      videosStudent = <VideosStudent>[];
      json['videosStudent'].forEach((v) {
        videosStudent!.add( VideosStudent.fromJson(v));
      });
    }
    teacherInfo = json['TeacherInfo'] != null
        ?  TeacherInfo.fromJson(json['TeacherInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.courseStudent != null) {
      data['courseStudent'] = this.courseStudent!.toJson();
    }
    if (this.videosStudent != null) {
      data['videosStudent'] =
          this.videosStudent!.map((v) => v.toJson()).toList();
    }
    if (this.teacherInfo != null) {
      data['TeacherInfo'] = this.teacherInfo!.toJson();
    }
    return data;
  }
}

class CourseStudent {
  String? img;
  String? name;
  int? id;
  int? viewerQuntity;
  int? numberOfVideos;
  int? teacherId;
  String? teacherImage;
  String? expected_time_to_finsh;

  CourseStudent(
      {this.img,
        this.name,
        this.id,
        this.viewerQuntity,
        this.numberOfVideos,
        this.teacherId,
        this.teacherImage,this.expected_time_to_finsh});

  CourseStudent.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
    viewerQuntity = json['viewer_quntity'];
    numberOfVideos = json['number_of_videos'];
    teacherId = json['teacher_id'];
    teacherImage = json['teacherImage'];
    expected_time_to_finsh = json['expected_time_to_finsh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['img'] = this.img;
    data['name'] = this.name;
    data['id'] = this.id;
    data['viewer_quntity'] = this.viewerQuntity;
    data['number_of_videos'] = this.numberOfVideos;
    data['teacher_id'] = this.teacherId;
    data['teacherImage'] = this.teacherImage;
    data['expected_time_to_finsh'] = this.expected_time_to_finsh;
    return data;
  }
}

class VideosStudent {
  String? img;
  String? name;
  int? id;
  int? isIntro;

  VideosStudent({this.img, this.name, this.id, this.isIntro});

  VideosStudent.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
    isIntro = json['isIntro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['img'] = this.img;
    data['name'] = this.name;
    data['id'] = this.id;
    data['isIntro'] = this.isIntro;
    return data;
  }
}

class TeacherInfo {
  String? firstName;
  String? lastName;

  TeacherInfo({this.firstName, this.lastName});

  TeacherInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}