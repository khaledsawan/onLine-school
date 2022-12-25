import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:school/service/model/common%20model/video_view_model.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/common model/id_model.dart';
import '../../model/common model/name_model.dart';
import '../../model/teacher model/teacher_add_list_model.dart';
import '../../model/teacher model/teacher_add_video_model.dart';
import '../../model/teacher model/teacher_search_video_model.dart';
import '../../model/teacher model/teacher_video_model.dart';

class TeacherVideoRepo extends GetxService {
  late final ApiClient apiClient;

  TeacherVideoRepo({required this.apiClient});

// Future<Response> GetProductList() async {
//   return await apiClient.getData(AppConstants.PRODUCT_URL);
// }
//
//   Future<Response> getMyProductList() async {
//     return await apiClient.getData(AppConstants.STUDENTHOUSEINDEX);
//   }

  Future<Response> store(
      TeacherAddVideoModel teacherVideoModel) {
    return apiClient.postData(
        AppConstants.TEACHER_ADD_VIDEO_URL, teacherVideoModel.toJson());
  }

Future<Response> destroy(IdModel idModel) async {
  return await apiClient.postData(
      AppConstants.DESTROYVIDOETEACHER, idModel.toJson());
}

Future<Response> show(IdModel id) async {
  return await apiClient.postData(
      AppConstants.SHOWVIDEOTEACHER, id.toJson());
}
  Future<Response> getSearchTeacherVideoList(TeacherSearchVideoModel teacherSearchVideoModel) async {
    return await apiClient.postData(AppConstants.TEACHER_COURSE_VIDEOS_SEARCH_URL,teacherSearchVideoModel.toJson());
  }
//
// Future<Response> update(UpdateProductModel updateProductModel) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_UPDATE, updateProductModel.toJson());
// }
}
