class AdIndexModel {
  bool? success;
  String? message;
  List<AdBodyModel>? data;

  AdIndexModel({this.success, this.message, this.data});

  AdIndexModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AdBodyModel>[];
      json['data'].forEach((v) {
        data!.add( AdBodyModel.fromJson(v));
      });
    }
  }


}

class AdBodyModel {
  String? img;
  int? id;

  AdBodyModel({this.img, this.id});

  AdBodyModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['img'] = this.img;
    data['id'] = this.id;
    return data;
  }
}