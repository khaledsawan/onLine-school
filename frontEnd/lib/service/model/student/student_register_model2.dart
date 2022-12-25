class StudentRegisterModel2 {
  String? firstName;
  String? lastName;
  String? email;
  int? phone;
  String? password;
  String? dio;

  StudentRegisterModel2(this.email, this.password, this.firstName, this.lastName,
      this.dio, this.phone);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['dio'] = dio;
    return data;
  }
}
