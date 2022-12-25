import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/student/student_update_profile.model.dart';


class StudentRepo extends GetxService {
  late final ApiClient apiClient;

  StudentRepo({required this.apiClient});

  Future<Response> getProfile() async {
    return await apiClient.getData(
        AppConstants.STUDENT_PROFILE_URL);
  }
  Future<Response> updateProfile(StudentUpdateProfileModel studentUpdateProfileModel) async {
    return await apiClient.postData(
        AppConstants.STUDENT_UPDATE_PROFILE_URL,studentUpdateProfileModel.toJson());
  }

}
