class TowIDModel {
  int? video_id;
  int? playList_id;
  TowIDModel({
    this.video_id,
    this.playList_id,
  });

  TowIDModel.fromJson(Map<String, dynamic> json) {
    video_id = json['video_id'];
    playList_id = json['playList_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['video_id'] = video_id;
    data['playList_id'] = playList_id;
    return data;
  }
}