import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:school/service/model/common%20model/name_model.dart';

import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/admin/admin_add_teacher_model.dart';
import '../../model/admin/admin_filter_model.dart';
import '../../model/admin/admin_teacher_update_profile.dart';
import '../../model/admin/admin_update_student_profile_model.dart';
import '../../model/common model/id_model.dart';


class AdminStudentRepo extends GetxService {
  late final ApiClient apiClient;

  AdminStudentRepo({required this.apiClient});

  Future<Response> getStudentList(FilterModel filterModel) {
    return apiClient.postData(
        AppConstants.ADMIN_STUDENT_INDEX, filterModel.toJson());
  }

  Future<Response> getTeacherListSearch(NameModel nameModel) {
    return apiClient.postData(
        AppConstants.ADMIN_STUDENT_SEARCH, nameModel.toJson());
  }

  Future<Response> showStudent(IdModel id) async {
    return await apiClient.postData(
        AppConstants.ADMIN_STUDENT_PROFILE, id.toJson());
  }

  Future<Response> deleteStudent(IdModel id) async {
    return await apiClient.postData(
        AppConstants.ADMIN_STUDENT_DELETE, id.toJson());
  }

  // Future<Response> storeStudent(AdminAddTeacherModel addTeacherModel) {
  //   return apiClient.postData(
  //       AppConstants.ADMIN_STUDENT_STORE, addTeacherModel.toJson());
  // }
  
  Future<Response> updateStudent(AdminUpdateStudentProfileModel adminUpdateStudentProfileModel) {
   print( adminUpdateStudentProfileModel.lastName);
    return apiClient.postData(
        AppConstants.ADMIN_STUDENT_UPDATE, adminUpdateStudentProfileModel.toJson());
  }
}
