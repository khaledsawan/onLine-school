class AdminAddAdModel {
  String? img;
  String? description;

  AdminAddAdModel(
      {this.img,
        this.description,
      });

  AdminAddAdModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['description'] = description;
    return data;
  }
}