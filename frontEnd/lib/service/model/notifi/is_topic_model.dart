class IsTopicModel {
  bool? success;
  int? topicId;

  IsTopicModel({this.success, this.topicId});

  IsTopicModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    topicId = json['topic_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = this.success;
    data['topic_id'] = this.topicId;
    return data;
  }
}