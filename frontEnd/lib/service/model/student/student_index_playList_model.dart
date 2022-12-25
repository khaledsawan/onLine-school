class StudentIndexPlayListModel {
  bool? success;
  List<PlayList>? playList;

  StudentIndexPlayListModel({this.success, this.playList});

  StudentIndexPlayListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['PlayList'] != null) {
      playList = <PlayList>[];
      json['PlayList'].forEach((v) {
        playList!.add( PlayList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.playList != null) {
      data['PlayList'] = this.playList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayList {
  String? name;
  int? id;

  PlayList({this.name, this.id});

  PlayList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}