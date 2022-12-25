class TeacherVideoModel {
  String? image;
  String? name;
  bool? isIntro;
  String? description;
  String? course_id;
  String? url;

  TeacherVideoModel(
      {this.image,
        this.name,
        this.isIntro,
        this.description,
        this.course_id,
        this.url,
      });

  TeacherVideoModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    isIntro = json['isIntro'];
    description = json['description'];
    course_id = json['course_id'];
    url = json['url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['isIntro'] = isIntro;
    data['description'] = description;
    data['course_id'] = course_id;
    data['url'] = url;
    return data;
  }
}