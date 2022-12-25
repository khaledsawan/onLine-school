class AdminUpdateStudentProfileModel {
  String? lastName;
  String? firstName;
  String? telegram;
  int? phone;
  int? id;
  String? dio;

  AdminUpdateStudentProfileModel({
    required this.lastName,
    required this.firstName,
    required this.telegram,
    required this.phone,
    required this.id,
    required this.dio,
  });

  AdminUpdateStudentProfileModel.fromJson(Map<String, dynamic> json) {
    lastName = json['lastName'];
    firstName = json['firstName'];
    telegram = json['telegram'];
    phone = json['phone'];
    id = json['id'];
    dio = json['dio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dio'] = dio;
    data['telegram'] = telegram;
    data['phone'] = phone;
    data['id'] = id;
    return data;
  }
}
