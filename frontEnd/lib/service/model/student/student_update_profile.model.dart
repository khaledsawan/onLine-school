class StudentUpdateProfileModel {
  String? firstName;
  String? lastName;
  int? phone;
  String? telegram;
  String? dio;

  StudentUpdateProfileModel( this.firstName, this.lastName,
      this.dio, this.phone, this.telegram);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['telegram'] = telegram;
    data['dio'] = dio;
    return data;
  }
}
