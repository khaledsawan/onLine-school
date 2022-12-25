import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/common model/id_model.dart';
import '../../model/common model/name_model.dart';
import '../../model/student/student_update_profile.model.dart';
import 'tow_id_model.dart';


class StudentPlayListRepo extends GetxService {
  late final ApiClient apiClient;

  StudentPlayListRepo({required this.apiClient});

  Future<Response> getMyPlayList() async {
    return await apiClient.getData(
        AppConstants.MY_PLAYLIST_URL);
  }
  Future<Response> createListView(NameModel nameModel) async {
    return await apiClient.postData(
        AppConstants.CREATE_PLAYLIST_URL,nameModel.toJson());
  }
  Future<Response> addVideoToList(TowIDModel towIDModel) async {
    return await apiClient.postData(
        AppConstants.ADD_VIDEO_TO_PLAYLIST_URL,towIDModel.toJson());
  }
  Future<Response> deleteListView(IdModel id) async {
    return await apiClient.postData(
        AppConstants.DELETE_PLAYLIST_URL,id.toJson());
  }
  Future<Response> viewListView(IdModel id) async {
    return await apiClient.postData(
        AppConstants.VIEW_PLAYLIST_URL,id.toJson());
  }

}
