class VideoViewModel {
  bool? _success;
  String? _message;
  Item? _item;

  VideoViewModel({bool? success, String? message, Item? item}) {
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (item != null) {
      this._item = item;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  Item? get item => _item;
  set item(Item? item) => _item = item;

  VideoViewModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _item = json['item'] != null ?  Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._item != null) {
      data['item'] = this._item!.toJson();
    }
    return data;
  }
}

class Item {
  int? _id;
  String? _img;
  String? _url;
  String? _descirption;
  String? _name;
  int? _teacherId;
  int? _courseId;
  int? _viewerQuntity;
  int? _isIntro;
  String? _createdAt;
  String? _updatedAt;

  Item(
      {int? id,
        String? img,
        String? url,
        String? descirption,
        String? name,
        int? teacherId,
        int? courseId,
        int? viewerQuntity,
        int? isIntro,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (img != null) {
      this._img = img;
    }
    if (url != null) {
      this._url = url;
    }
    if (descirption != null) {
      this._descirption = descirption;
    }
    if (name != null) {
      this._name = name;
    }
    if (teacherId != null) {
      this._teacherId = teacherId;
    }
    if (courseId != null) {
      this._courseId = courseId;
    }
    if (viewerQuntity != null) {
      this._viewerQuntity = viewerQuntity;
    }
    if (isIntro != null) {
      this._isIntro = isIntro;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get descirption => _descirption;
  set descirption(String? descirption) => _descirption = descirption;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get teacherId => _teacherId;
  set teacherId(int? teacherId) => _teacherId = teacherId;
  int? get courseId => _courseId;
  set courseId(int? courseId) => _courseId = courseId;
  int? get viewerQuntity => _viewerQuntity;
  set viewerQuntity(int? viewerQuntity) => _viewerQuntity = viewerQuntity;
  int? get isIntro => _isIntro;
  set isIntro(int? isIntro) => _isIntro = isIntro;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Item.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _img = json['img'];
    _url = json['url'];
    _descirption = json['descirption'];
    _name = json['name'];
    _teacherId = json['teacher_id'];
    _courseId = json['course_id'];
    _viewerQuntity = json['viewer_quntity'];
    _isIntro = json['isIntro'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this._id;
    data['img'] = this._img;
    data['url'] = this._url;
    data['descirption'] = this._descirption;
    data['name'] = this._name;
    data['teacher_id'] = this._teacherId;
    data['course_id'] = this._courseId;
    data['viewer_quntity'] = this._viewerQuntity;
    data['isIntro'] = this._isIntro;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
