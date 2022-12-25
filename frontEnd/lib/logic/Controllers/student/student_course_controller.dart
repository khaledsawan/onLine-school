import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/student/student_profile_controller.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/name_model.dart';
import '../../../service/model/student/student_course_view_model.dart';
import '../../../service/model/student/student_courses_model.dart';
import '../../../service/model/student/student_teacher_profile_model.dart';
import '../../../service/model/teacher model/teacher_search_model.dart';
import '../../../service/repository/student/student_course_repo.dart';
import '../notifi/notifi_controller.dart';

class StudentCourseController extends GetxController {
  late StudentCourseRepo studentCourseRepo;
  StudentCourseController({required this.studentCourseRepo});

  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  late List<Courses> _productList = [];
  List<Courses> get productList => _productList;

  final List<String> _sortType = ['Time', 'oldest'];
  List<String> get sortType => _sortType;

  late StudentTeacherProfileModel studentTeacherProfileModel;
  late final List<SearchData> _searchList = [];
  List<SearchData> get searchList => _searchList;

  @override
  void onInit() {
    getCoursesList();
    super.onInit();
  }

  late StudentCourseViewModel courseViewModel;

  Future<void> getCoursesList() async {
    _isLoaded = true;
    Response response = await studentCourseRepo.getProductList();
    if (response.statusCode == 200) {
      _isLoaded = false;
      _productList = [];
      _productList
          .addAll(StudentCoursesModel.fromJson(response.body!).courses!);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

  Future<void> getTeacherCoursesList(int id) async {
    _isLoaded = true;
    Response response = await studentCourseRepo.getTeacherCourses(
        IdModel(id: id));
    if (response.statusCode == 200) {
      _isLoaded = false;
      studentTeacherProfileModel =
          StudentTeacherProfileModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

  Future<List<SearchData>> getCourseSearch({String? query}) async {
    _isLoaded = true;
    Response response =
        await studentCourseRepo.getSearchTeacherList(NameModel(name: query));
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
    update();
    Response response = await studentCourseRepo.showCourse(IdModel(id: id));
    if (response.statusCode == 200) {
      _isLoaded = false;
      courseViewModel = StudentCourseViewModel.fromJson(response.body);
      Get.find<NotifiController>().isTopic(
          teacherId: Get.find<StudentCourseController>()
              .courseViewModel
              .courseStudent!
              .teacherId!,
          studentId: Get.find<StudentProfileController>()
              .studentProfileModel
              .user!
              .id!);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  ScrollController scrollController = ScrollController();

  changeSort() {
    if (dragStartBehavior.name == 'start') {
      dragStartBehavior = DragStartBehavior.down;
      scrollController.jumpTo(0.0);
      update();
    } else {
      dragStartBehavior = DragStartBehavior.start;
      scrollController.jumpTo(_productList.length.toDouble());
      update();
    }
  }
}
