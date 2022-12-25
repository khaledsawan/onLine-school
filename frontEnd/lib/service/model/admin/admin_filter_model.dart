class FilterModel {
  String? filter;
  FilterModel({
    this.filter,
  });

  FilterModel.fromJson(Map<String, dynamic> json) {
    filter = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['filter'] = filter;
    return data;
  }
}