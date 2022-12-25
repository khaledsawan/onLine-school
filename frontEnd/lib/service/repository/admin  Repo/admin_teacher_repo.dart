import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:school/service/model/common%20model/name_model.dart';

import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/admin/admin_add_teacher_model.dart';
import '../../model/admin/admin_filter_model.dart';
import '../../model/admin/admin_teacher_update_profile.dart';
import '../../model/common model/id_model.dart';
import '../../model/teacher model/teacher_search_video_model.dart';


class AdminTeacherRepo extends GetxService {
  late final ApiClient apiClient;

  AdminTeacherRepo({required this.apiClient});

  Future<Response> getTeacherList(FilterModel filterModel) {
    return apiClient.postData(
        AppConstants.ADMIN_TEACHER_INDEX, filterModel.toJson());
  }

  Future<Response> getTeacherListSearch(NameModel nameModel) {
    return apiClient.postData(
        AppConstants.ADMIN_TEACHER_SEARCH, nameModel.toJson());
  }

  Future<Response> GetSearchTeacherVideoList(TeacherSearchVideoModel teacherSearchVideoModel) async {
    return await apiClient.postData(AppConstants.TEACHER_COURSE_VIDEOS_SEARCH_URL,teacherSearchVideoModel.toJson());
  }

  Future<Response> showTeacher(IdModel id) async {
    return await apiClient.postData(
        AppConstants.ADMIN_TEACHER_PROFILE, id.toJson());
  }

  Future<Response> deleteTeacher(IdModel id) async {
    return await apiClient.postData(
        AppConstants.ADMIN_TEACHER_DELETE, id.toJson());
  }

  Future<Response> storeTeacher(AdminAddTeacherModel addTeacherModel) {
    return apiClient.postData(
        AppConstants.ADMIN_TEACHER_STORE, addTeacherModel.toJson());
  }
  Future<Response> updateTeacher(AdminUpdateTeacherModel adminUpdateTeacherModel) {
    return apiClient.postData(
        AppConstants.ADMIN_TEACHER_UPDATE, adminUpdateTeacherModel.toJson());
  }
}
