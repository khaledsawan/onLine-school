import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/admin/admin_add_ad_model.dart';
import '../../model/common model/id_model.dart';
import '../../model/teacher model/teacher_add_list_model.dart';

class TeacherRepo extends GetxService {
  late final ApiClient apiClient;

  TeacherRepo({required this.apiClient});

  Future<Response> getProfile() async {
    return await apiClient.getData(
        AppConstants.TEACHER_PROFILE_URL);
  }

}
