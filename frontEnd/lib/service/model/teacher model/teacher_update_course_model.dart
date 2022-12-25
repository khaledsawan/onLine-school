class TeacherUpdateCourseModel {
  int? id;
  String? name;
  String? category;
  String? expected_time_to_finsh;
  String? img;

  TeacherUpdateCourseModel(this.id,this.name, this.category,this.expected_time_to_finsh,this.img);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['expected_time_to_finsh'] = expected_time_to_finsh;
    data['category'] = category;
    data['img'] = img;
    return data;
  }
}