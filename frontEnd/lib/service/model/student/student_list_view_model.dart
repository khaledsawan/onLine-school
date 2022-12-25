class StudentListViewModel {
  bool? success;
  PlayListVideos? playList;
  List<VideoplayList>? videoPlayList;

  StudentListViewModel({this.success, this.playList, this.videoPlayList});

  StudentListViewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    playList = json['PlayList'] != null
        ?  PlayListVideos.fromJson(json['PlayList'])
        : null;
    if (json['videoplayList'] != null) {
      videoPlayList = <VideoplayList>[];
      json['videoplayList'].forEach((v) {
        videoPlayList!.add( VideoplayList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    if (this.playList != null) {
      data['PlayList'] = this.playList!.toJson();
    }
    if (this.videoPlayList != null) {
      data['videoplayList'] =
          this.videoPlayList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayListVideos {
  int? id;
  String? name;
  int? studentId;
  String? createdAt;
  String? updatedAt;

  PlayListVideos(
      {this.id, this.name, this.studentId, this.createdAt, this.updatedAt});

  PlayListVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['student_id'] = this.studentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class VideoplayList {
  int? videoId;
  String? videoImage;
  String? videoName;

  VideoplayList({this.videoId, this.videoImage, this.videoName});

  VideoplayList.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    videoImage = json['videoImage'];
    videoName = json['videoName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['video_id'] = this.videoId;
    data['videoImage'] = this.videoImage;
    data['videoName'] = this.videoName;
    return data;
  }
}