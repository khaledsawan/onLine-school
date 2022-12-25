class AdminAddTeacherModel {
  String? img;
  String? lastName;
  String? firstName;
  String? email;
  String? telegram;
  int? phone;
  String? dio;
  String? password;

  AdminAddTeacherModel({
    required this.img,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.telegram,
    required this.phone,
    required this.dio,
    required this.password,
  });

  AdminAddTeacherModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    email = json['email'];
    telegram = json['telegram'];
    phone = json['phone'];
    dio = json['dio'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['img'] = img;
    data['dio'] = dio;
    data['telegram'] = telegram;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
