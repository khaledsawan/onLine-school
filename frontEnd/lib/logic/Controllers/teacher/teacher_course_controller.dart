import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:school/logic/Controllers/admin/admin_category_controller.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/category_index_model.dart';
import '../../../service/model/common model/course_view_model.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/name_model.dart';
import '../../../service/model/notifi/notifi_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/teacher model/teacher_add_list_model.dart';
import '../../../service/model/teacher model/teacher_courses_model.dart';
import '../../../service/model/teacher model/teacher_search_model.dart';
import '../../../service/model/teacher model/teacher_update_course_model.dart';
import '../../../service/repository/teacher/teacher_course_repo.dart';
import 'dart:io';
import '../notifi/notifi_controller.dart';
import 'teacher_profile_controller.dart';

class TeacherCourseController extends GetxController {
  late TeacherCourseRepo teacherCourseRepo;
  TeacherCourseController({required this.teacherCourseRepo});
  late TextEditingController nameController,
      categoryController,
      searchWordController;

  bool _isLoaded = true;
  get isLoaded => _isLoaded;

  DateTime selectedDate = DateTime.now();

  late String imageName = '';
  late String imageUrl = '1';
  late File file;
  late PickedFile? image;

  late List<Data> _productList = [];
  List<Data> get productList => _productList;

  late List<SearchData> _searchList = [];
  List<SearchData> get SearchList => _searchList;

  late CourseViewModel courseViewModel;

  Category categorySelected = Category(name: 'java', id: 1);
  get categoryMethod => categorySelected;

  setMethod(Category payment) {
    categorySelected = payment;
    update();
  }

  @override
  void dispose() async {
    nameController.dispose();
    categoryController.dispose();
    searchWordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    Get.find<AdminCategoryController>().getCategoryList().then((value) {
      getCoursesList();
      // categorySelected = Get.find<AdminCategoryController>().firstCategory;
    });
    nameController = TextEditingController();
    categoryController = TextEditingController();
    searchWordController = TextEditingController();
    super.onInit();
  }

  updateTime(DateTime dateTime) {
    selectedDate = dateTime;
    update();
  }

  gallery() async {
    final imagePicker = ImagePicker();
    image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image!.path);
      imageName = basename(image!.path);
      Get.back();
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }

  camera() async {
    final imagePicker = ImagePicker();
    PickedFile? image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      imageName = basename(image.path);
      Get.back();
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }

  clearImage() {
    imageName = '';
    imageUrl = '1';
    file.delete();
    update();
  }

  Future<void> getCoursesList() async {
    _isLoaded = true;
    Response response = await teacherCourseRepo.GetProductList();
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      _productList = [];
      _productList.addAll(TeacherCoursesModel.fromJson(response.body!).data!);
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
        await teacherCourseRepo.getSearchTeacherList(NameModel(name: query));
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
    Response response = await teacherCourseRepo.showCourse(IdModel(id: id));
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      courseViewModel = CourseViewModel.fromJson(response.body);
      nameController.text = courseViewModel.course!.name!;
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

  saveMethod() {
    String name = nameController.text.trim();
    if (name.isEmpty) {
      showCustomSnackBarRed('enter your name ', 'empty field');
    } else if (imageName == '') {
      showCustomSnackBarRed('Add image ', 'empty image');
    } else {
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      TeacherAddListModel teacherAddListModel = TeacherAddListModel(
          name,
          categorySelected.name,
          DateFormat('yyyy-MM-dd').format(selectedDate),
          base64Image);
      storeProduct(teacherAddListModel).then((status) async {
        if (status.isSuccessful!) {
          getCoursesList();
          Get.toNamed(AppRoutes.teachercourses);
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> storeProduct(
      TeacherAddListModel productStoreModel) async {
    ResponseModel responseModel;
    _isLoaded = true;
    update();
    Response response = await teacherCourseRepo.store(productStoreModel);
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      TeacherProfileController controller =
          Get.find<TeacherProfileController>();
      NotifiController notifiController = Get.find<NotifiController>();
      NotifiModel notifi = NotifiModel(
          to: '/topics/${controller.teacherModel.teacher!.userId!}',
          priority: 'high',
          notificationBody: NotificationBody(
              title: controller.teacherModel.user!.firstName! +
                  controller.teacherModel.user!.lastName!,
              body: 'The Teacher added a new course to his list'),
          data: DataNotifi(
              image: controller.teacherModel.teacher!.img!,
              teacher_id: controller.teacherModel.teacher!.userId!));
      await notifiController.massage.subscribeToTopic(
          controller.teacherModel.teacher!.userId!.toString());
      await notifiController.sendNotifi(notifi);
      update();
    } else {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> updateProduct(
      TeacherUpdateCourseModel productStoreModel) async {
    ResponseModel responseModel;
    _isLoaded = true;
    update();
    Response response = await teacherCourseRepo.update(productStoreModel);
    if (response.statusCode == 200) {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);

      update();
    } else {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
    }
    update();
    return responseModel;
  }

  updateMethod(TeacherCourseController teacherController) {
    String name = teacherController.nameController.text.trim();
    if (name.isEmpty) {
      showCustomSnackBarRed('enter your name ', 'empty field');
    } else if (teacherController.imageName == '') {
      showCustomSnackBarRed('Add image ', 'empty image');
    } else {
      List<int> imageBytes = teacherController.file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      TeacherUpdateCourseModel teacherUpdateCourseModel =
          TeacherUpdateCourseModel(
              teacherController.courseViewModel.course!.id!,
              name,
              categorySelected.name,
              DateFormat('yyyy-MM-dd').format(teacherController.selectedDate),
              base64Image);
      teacherController
          .updateProduct(teacherUpdateCourseModel)
          .then((status) async {
        if (status.isSuccessful!) {
          Get.back();
          getCoursesList();
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<void> deleteCourse({required int id}) async {
    _isLoaded = true;
    update();
    Response response = await teacherCourseRepo.destroy(IdModel(id: id));
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      getCoursesList();
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }
}
