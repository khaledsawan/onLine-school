class TeacherAddVideoModel {
  String? name;
  String? description;
  bool? isIntro;
  String? img;
  String? url;
  int? course_id;

  TeacherAddVideoModel(this.name, this.description,this.isIntro,this.img,this.url,this.course_id);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['isIntro'] = isIntro;
    data['img'] = img;
    data['url'] = url;
    data['course_id'] = course_id;
    return data;
  }
}
