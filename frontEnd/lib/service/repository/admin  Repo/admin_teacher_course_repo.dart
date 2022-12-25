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

class AdminTeacherCourseRepo extends GetxService {
  late final ApiClient apiClient;

  AdminTeacherCourseRepo({required this.apiClient});

  Future<Response> showCourse(IdModel id) async {
    return await apiClient.postData(
        AppConstants.TEACHER_VIEW_COURS_URL, id.toJson());
  }

  Future<Response> getSearchStudentVideoList(TeacherSearchVideoModel teacherSearchVideoModel) async {
    return await apiClient.postData(AppConstants.STUDENT_COURSE_VIDEOS_SEARCH_URL,teacherSearchVideoModel.toJson());
  }
  Future<Response> destroy(IdModel idModel) async {
    return await apiClient.postData(
        AppConstants.DESTROYVIDOETEACHER, idModel.toJson());
  }

}
