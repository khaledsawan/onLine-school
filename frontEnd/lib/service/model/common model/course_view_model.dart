class CourseViewModel {
  bool? _success;
  String? _message;
  Course? _course;
  List<Videos>? _videos;

  CourseViewModel(
      {bool? success, String? message, Course? course, List<Videos>? videos}) {
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (course != null) {
      this._course = course;
    }
    if (videos != null) {
      this._videos = videos;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  Course? get course => _course;
  set course(Course? course) => _course = course;
  List<Videos>? get videos => _videos;
  set videos(List<Videos>? videos) => _videos = videos;

  CourseViewModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    if (json['videos'] != null) {
      _videos = <Videos>[];
      json['videos'].forEach((v) {
        _videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._course != null) {
      data['course'] = this._course!.toJson();
    }
    if (this._videos != null) {
      data['videos'] = this._videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  String? _img;
  String? _name;
  String? _expected_time_to_finsh;
  int? _viewerQuntity;
  int? _numberOfVideos;
  int? _id;

  Course(
      {String? img,
        String? name,
        String? expected_time_to_finsh,
        int? viewerQuntity,
        int? numberOfVideos,
        int? id}) {
    if (img != null) {
      this._img = img;
    }
    if (name != null) {
      this._name = name;
    }
    if (name != null) {
      this._expected_time_to_finsh = expected_time_to_finsh;
    }
    if (viewerQuntity != null) {
      this._viewerQuntity = viewerQuntity;
    }
    if (numberOfVideos != null) {
      this._numberOfVideos = numberOfVideos;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get img => _img;
  set img(String? img) => _img = img;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get expected_time_to_finsh => _expected_time_to_finsh;
  set expected_time_to_finsh(String? expected_time_to_finsh) => _expected_time_to_finsh = expected_time_to_finsh;
  int? get viewerQuntity => _viewerQuntity;
  set viewerQuntity(int? viewerQuntity) => _viewerQuntity = viewerQuntity;
  int? get numberOfVideos => _numberOfVideos;
  set numberOfVideos(int? numberOfVideos) => _numberOfVideos = numberOfVideos;
  int? get id => _id;
  set id(int? id) => _id = id;

  Course.fromJson(Map<String, dynamic> json) {
    _img = json['img'];
    _name = json['name'];
    _expected_time_to_finsh = json['expected_time_to_finsh'];
    _viewerQuntity = json['viewer_quntity'];
    _numberOfVideos = json['number_of_videos'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this._img;
    data['name'] = this._name;
    data['expected_time_to_finsh'] = this.expected_time_to_finsh;
    data['viewer_quntity'] = this._viewerQuntity;
    data['number_of_videos'] = this._numberOfVideos;
    data['id'] = this._id;
    return data;
  }
}

class Videos {
  String? _img;
  String? _name;
  int? _id;
  int? _isIntro;

  Videos({String? img, String? name, int? id, int? isIntro}) {
    if (img != null) {
      this._img = img;
    }
    if (name != null) {
      this._name = name;
    }
    if (id != null) {
      this._id = id;
    }
    if (isIntro != null) {
      this._isIntro = isIntro;
    }
  }

  String? get img => _img;
  set img(String? img) => _img = img;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get id => _id;
  set id(int? id) => _id = id;
  int? get isIntro => _isIntro;
  set isIntro(int? isIntro) => _isIntro = isIntro;

  Videos.fromJson(Map<String, dynamic> json) {
    _img = json['img'];
    _name = json['name'];
    _id = json['id'];
    _isIntro = json['isIntro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this._img;
    data['name'] = this._name;
    data['id'] = this._id;
    data['isIntro'] = this._isIntro;
    return data;
  }
}