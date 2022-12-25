class AdminTeacherViewCourse {
  bool? success;
  String? message;
  CourseStudent? courseStudent;
  List<VideosStudent>? videosStudent;
  TeacherInfo? teacherInfo;

  AdminTeacherViewCourse(
      {this.success,
        this.message,
        this.courseStudent,
        this.videosStudent,
        this.teacherInfo});

  AdminTeacherViewCourse.fromJson(Map<String, dynamic> json) {
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
        ? new TeacherInfo.fromJson(json['TeacherInfo'])
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
  String? expectedTimeToFinsh;
  String? name;
  int? id;
  int? viewerQuntity;
  int? numberOfVideos;
  int? teacherId;
  String? teacherImage;

  CourseStudent(
      {this.img,
        this.expectedTimeToFinsh,
        this.name,
        this.id,
        this.viewerQuntity,
        this.numberOfVideos,
        this.teacherId,
        this.teacherImage});

  CourseStudent.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    expectedTimeToFinsh = json['expected_time_to_finsh'];
    name = json['name'];
    id = json['id'];
    viewerQuntity = json['viewer_quntity'];
    numberOfVideos = json['number_of_videos'];
    teacherId = json['teacher_id'];
    teacherImage = json['teacherImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['img'] = this.img;
    data['expected_time_to_finsh'] = this.expectedTimeToFinsh;
    data['name'] = this.name;
    data['id'] = this.id;
    data['viewer_quntity'] = this.viewerQuntity;
    data['number_of_videos'] = this.numberOfVideos;
    data['teacher_id'] = this.teacherId;
    data['teacherImage'] = this.teacherImage;
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