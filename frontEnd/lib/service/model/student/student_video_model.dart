class StudentViewModel {
  bool? success;
  String? message;
  VideoStudent? item;

  StudentViewModel({this.success, this.message, this.item});

  StudentViewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    item = json['item'] != null ?  VideoStudent.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class VideoStudent {
  int? id;
  String? img;
  String? url;
  String? descirption;
  String? name;
  int? teacherId;
  int? courseId;
  int? viewerQuntity;
  int? isIntro;
  String? createdAt;
  String? updatedAt;

  VideoStudent(
      {this.id,
        this.img,
        this.url,
        this.descirption,
        this.name,
        this.teacherId,
        this.courseId,
        this.viewerQuntity,
        this.isIntro,
        this.createdAt,
        this.updatedAt});

  VideoStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    url = json['url'];
    descirption = json['descirption'];
    name = json['name'];
    teacherId = json['teacher_id'];
    courseId = json['course_id'];
    viewerQuntity = json['viewer_quntity'];
    isIntro = json['isIntro'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['img'] = this.img;
    data['url'] = this.url;
    data['descirption'] = this.descirption;
    data['name'] = this.name;
    data['teacher_id'] = this.teacherId;
    data['course_id'] = this.courseId;
    data['viewer_quntity'] = this.viewerQuntity;
    data['isIntro'] = this.isIntro;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}