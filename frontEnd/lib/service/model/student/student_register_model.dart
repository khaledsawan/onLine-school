class StudentRegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  int? phone;
  String? password;
  String? telegram;
  String? dio;

  StudentRegisterModel(this.email, this.password, this.firstName, this.lastName,
      this.dio, this.phone, this.telegram);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['telegram'] = telegram;
    data['dio'] = dio;
    return data;
  }
}
