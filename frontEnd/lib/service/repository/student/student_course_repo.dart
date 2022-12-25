import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/admin/admin_add_ad_model.dart';
import '../../model/common model/id_model.dart';
import '../../model/common model/name_model.dart';
import '../../model/teacher model/teacher_add_list_model.dart';
import '../../model/teacher model/teacher_update_course_model.dart';

class StudentCourseRepo extends GetxService {
  late final ApiClient apiClient;

  StudentCourseRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstants.STUDENT_COURSES_URL);
  }
  Future<Response> getTeacherCourses(IdModel idModel) async {
    return await apiClient.postData(AppConstants.ADMIN_TEACHER_PROFILE,idModel.toJson());
  }
  Future<Response> getSearchTeacherList(NameModel nameModel) async {
    return await apiClient.postData(AppConstants.STUDENT_SEARCH_COURSE_URL,nameModel.toJson());
  }
  Future<Response> store(
      TeacherAddListModel adminAddAdModel) {
    return apiClient.postData(
        AppConstants.STORE_COURSE_TEACHER_URL, adminAddAdModel.toJson());
  }

  Future<Response> destroy(IdModel id) async {
    return await apiClient.postData(
        AppConstants.DESTROYCOURSETEACHER, id.toJson());
  }

//
  Future<Response> showCourse(IdModel id) async {
    return await apiClient.postData(
        AppConstants.STUDENTCOURSES_URL, id.toJson());
  }
//
  Future<Response> update( TeacherUpdateCourseModel adminAddAdModel) async {
    return await apiClient.postData(
        AppConstants.TEACHER_UPDATE_COURSE_URL, adminAddAdModel.toJson());
  }
}
