class AdViewModel {
  bool? success;
  String? message;
  Item? item;

  AdViewModel({this.success, this.message, this.item});

  AdViewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    item = json['item'] != null ?  Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class Item {
  int? id;
  String? description;
  String? img;
  String? createdAt;
  String? updatedAt;

  Item({this.id, this.description, this.img, this.createdAt, this.updatedAt});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['img'] = img;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}