class TeacherAddListModel {
  String? name;
  String? category;
  String? expected_time_to_finsh;
  String? img;

  TeacherAddListModel(this.name, this.category,this.expected_time_to_finsh,this.img);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['expected_time_to_finsh'] = expected_time_to_finsh;
    data['category'] = category;
    data['img'] = img;
    return data;
  }
}
