import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:school/service/repository/teacher/teacher_video_repo.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/teacher model/teacher_add_video_model.dart';
import '../../../service/model/teacher model/teacher_search_model.dart';
import '../../../service/model/teacher model/teacher_search_video_model.dart';
import '../../../service/model/common model/video_view_model.dart';
import 'dart:io';
import 'teacher_course_controller.dart';

class TeacherVideoController extends GetxController {
  late TeacherVideoRepo teacherVideoRepo;
  TeacherVideoController({required this.teacherVideoRepo});

  bool isIntro = false;

  late TextEditingController urlController,
      titleController,
      descriptionController;

  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  late List<SearchData> _searchList = [];
  List<SearchData> get SearchList => _searchList;

  DateTime selectedDate = DateTime.now();

  late String imageName = '';
  late String imageUrl = '1';
  late File file;
  late PickedFile? image;
  late Uint8List? uint8list; //for web

  @override
  void dispose() async {
    urlController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    urlController = TextEditingController();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  updateTime(DateTime dateTime) {
    print(dateTime.day);
    selectedDate = dateTime;
    update();
  }

  isIntroMethod(bool isIntro) {
    this.isIntro = isIntro;
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

  VideoViewModel videoViewModel = VideoViewModel();

  Future<ResponseModel> viewVideo({required int id}) async {
    _isLoaded = true;
    Response response = await teacherVideoRepo.show(IdModel(id: id));
    print(response.statusCode);
    update();
    if (response.statusCode == 200) {
      _isLoaded = false;
      videoViewModel = VideoViewModel.fromJson(response.body);
      ResponseModel res = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      update();
      return res;
    } else {
      _isLoaded = false;
      showCustomSnackBarRed(
          'check your internet connection',
          'error');
      ResponseModel res = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
      return res;
    }
  }

  Future<List<SearchData>> getVideoSearch({String? query, int? id}) async {
    _isLoaded = true;
    Response response = await teacherVideoRepo.getSearchTeacherVideoList(
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

  saveMethod(TeacherVideoController teacherVideoController) {
    String url = teacherVideoController.urlController.text.trim();
    String title = teacherVideoController.titleController.text.trim();
    String description =
        teacherVideoController.descriptionController.text.trim();
    if (url.isEmpty) {
      showCustomSnackBarRed('enter your url ', 'empty field');
    } else if (teacherVideoController.imageName == '') {
      showCustomSnackBarRed('Add image ', 'empty image');
    } else {
      List<int> imageBytes = teacherVideoController.file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      int id = Get.find<TeacherCourseController>().courseViewModel.course!.id!;
      TeacherAddVideoModel teacherVideoModel = TeacherAddVideoModel(
          title, description, isIntro, base64Image, url, id);
      teacherVideoController.storeVideo(teacherVideoModel).then((status) async {
        if (status.isSuccessful!) {
          Get.find<TeacherCourseController>().viewCourse(id: id);
          Get.toNamed(AppRoutes.teacherviewCourse);
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> storeVideo(
      TeacherAddVideoModel teacherVideoModel) async {
    ResponseModel responseModel;
    _isLoaded = true;
    update();
    Response response = await teacherVideoRepo.store(teacherVideoModel);
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
    return responseModel;
  }

  Future<void> deleteVideo({required int id}) async {
    _isLoaded = true;
    Response response = await teacherVideoRepo.destroy(IdModel(id: id));
    print('delete video'+response.statusCode.toString());
    if (response.statusCode == 200) {
      _isLoaded = false;
      Get.back();
      update();
      Get.find<TeacherCourseController>().viewCourse(
          id: Get.find<TeacherCourseController>().courseViewModel.course!.id!);
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }
}
