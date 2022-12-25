class LoginModel {
  String? _token;
  String? _role;

  TeacherLoginModel({String? token, String? role}) {
    if (token != null) {
      this._token = token;
    }
    if (role != null) {
      this._role = role;
    }
  }

  String? get token => _token;
  set token(String? token) => _token = token;
  String? get role => _role;
  set role(String? role) => _role = role;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _role = json['role'];
  }
}