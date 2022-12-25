import 'package:get/get.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/admin/admin_teacher_view_course.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/teacher model/teacher_search_model.dart';
import '../../../service/model/teacher model/teacher_search_video_model.dart';
import '../../../service/repository/admin  Repo/admin_teacher_course_repo.dart';


class AdminTeacherCourseController extends GetxController {
  late AdminTeacherCourseRepo adminTeacherCourseRepo;
  AdminTeacherCourseController({required this.adminTeacherCourseRepo});

  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  late List<SearchData> _searchList = [];
  List<SearchData> get SearchList => _searchList;

  late AdminTeacherViewCourse courseViewModel;


  Future<List<SearchData>> getVideoSearch({String? query, int? id}) async {
    _isLoaded = true;
    Response response = await adminTeacherCourseRepo.getSearchStudentVideoList(
        TeacherSearchVideoModel(name: query, id: id));
    if (response.statusCode == 200) {
      _isLoaded = false;
      update();
      return TeacherSearchModel.fromJson(response.body!).data!;
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
      return _searchList;
    }
  }

  Future<void> viewCourse({required int id}) async {
    _isLoaded = true;
    Response response =
        await adminTeacherCourseRepo.showCourse(IdModel(id: id));
    update();
    if (response.statusCode == 200) {
      _isLoaded = false;
      courseViewModel = AdminTeacherViewCourse.fromJson(response.body);
     // nameController.text = courseViewModel.course!.name!;
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }
  Future<void> deleteVideo({required int id}) async {
    _isLoaded = true;
    Response response = await adminTeacherCourseRepo.destroy(IdModel(id: id));
    if (response.statusCode == 200) {
      _isLoaded = false;
      Get.back();
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

}
