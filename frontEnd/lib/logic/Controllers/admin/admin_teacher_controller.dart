import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/admin/admin_add_teacher_model.dart';
import '../../../service/model/admin/admin_filter_model.dart';
import '../../../service/model/admin/admin_teacher_index.dart';
import '../../../service/model/admin/admin_teacher_profile_model.dart';
import '../../../service/model/admin/admin_teacher_search_list.dart';
import '../../../service/model/admin/admin_teacher_update_profile.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/name_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/repository/admin  Repo/admin_teacher_repo.dart';

class AdminTeacherController extends GetxController {
  late AdminTeacherRepo adminRepo;
  AdminTeacherController({required this.adminRepo});

  late AdminTeacherIndex adminTeacherIndex;
  late AdminTeacherSearchList adminTeacherSearchList;
  late AdminTeacherProfileModel adminTeacherProfileModel;

  late TextEditingController firstNameController,
      lastNameController,
      emailController,
      passwordController,
      phoneController,
      telegramController,
      dioController;

  bool _isLoad = false;
  get isLoad => _isLoad;

  final PageController _pageController = PageController(viewportFraction: 0.85);
  get pageController => _pageController;
  var currPageValue = 0.0;

  late String imageName = '';
  late String imageUrl = '1';
  late File file;
  late PickedFile? image;
  late Uint8List? uint8list; //web

  String sortSelected = 'id';
  changeSort(String item) {
    sortSelected = item;
    update();
    getTeacherList();
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
    // ignore: deprecated_member_use
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

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    telegramController = TextEditingController();
    passwordController = TextEditingController();
    dioController = TextEditingController();
    phoneController = TextEditingController();
    getTeacherList();
    _pageController.addListener(() {
      currPageValue = _pageController.page!;
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    telegramController.dispose();
    dioController.dispose();
    phoneController.dispose();
    _pageController.dispose();
  }

  Future<void> getTeacherList() async {
    _isLoad = true;
    Response response = await adminRepo
        .getTeacherList(FilterModel(filter: 'users.$sortSelected'));
    if (response.statusCode == 200) {
      _isLoad = false;
      adminTeacherIndex = AdminTeacherIndex.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
    }
  }

  Future<List<Teachers>> getCourseSearch({String? query}) async {
    _isLoad = true;
    Response response =
        await adminRepo.getTeacherListSearch(NameModel(name: query));
    if (response.statusCode == 200) {
      _isLoad = false;
      update();
      adminTeacherSearchList = AdminTeacherSearchList.fromJson(response.body!);
      return adminTeacherSearchList.teachers!;
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
      return [];
    }
  }

  Future<void> viewTeacher(int id) async {
    _isLoad = true;
    update();
    Response response = await adminRepo.showTeacher(IdModel(id: id));

    if (response.statusCode == 200) {
      _isLoad = false;
      adminTeacherProfileModel =
          AdminTeacherProfileModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
    }
  }

  Future<void> deleteTeacher() async {
    _isLoad = true;
    update();
    Response response = await adminRepo
        .deleteTeacher(IdModel(id: adminTeacherProfileModel.userTeacher!.id!));
    if (response.statusCode == 200) {

      Get.back();
      Get.back();
      getTeacherList();
      update();
    } else {
      showCustomSnackBarRed(response.statusText.toString(), 'Error');
      _isLoad = false;
      update();
    }
  }
  saveMethod() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String dio = dioController.text.trim();
    String telegram = telegramController.text.trim();
    String password = passwordController.text.trim();
    if (firstName.isEmpty) {
      showCustomSnackBarRed('enter your first Name ', 'empty field');
    } else if (lastName.isEmpty) {
      showCustomSnackBarRed('enter your last Name ', 'empty field');
    } else if (telegram.isEmpty) {
      showCustomSnackBarRed('enter your telegram ', 'empty field');
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBarRed('email not valid', 'not valid');
    } else if (!GetUtils.isPhoneNumber(phone)) {
      showCustomSnackBarRed('phone not valid only number', 'not valid');
    } else if (dio.isEmpty) {
      showCustomSnackBarRed('enter your dio', 'empty field');
    } else if (password.isEmpty) {
      showCustomSnackBarRed('enter your password', 'empty field');
    } else if (imageName == '') {
      showCustomSnackBarRed('Add image ', 'empty image');
    } else {
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      AdminAddTeacherModel addTeacherModel = AdminAddTeacherModel(
          img: base64Image,
          lastName: lastName,
          firstName: firstName,
          email: email,
          telegram: telegram,
          phone: int.parse(phone),
          dio: dio,
          password: password);

      await storeTeacher(addTeacherModel).then((status) async {
        if (status.isSuccessful!) {
          Get.back();
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> storeTeacher(
      AdminAddTeacherModel addTeacherModel) async {
    ResponseModel responseModel;
    _isLoad = true;
    update();
    Response response = await adminRepo.storeTeacher(addTeacherModel);

    if (response.statusCode == 200) {
      _isLoad = false;
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      update();
    } else {
      _isLoad = false;
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
    }
    return responseModel;
  }

  updateMethod() {
    String firstName = firstNameController.text.trim();
    String lastName  = lastNameController.text.trim();
    String phone     = phoneController.text.trim();
    String dio       = dioController.text.trim();
    String telegram  = telegramController.text.trim();
    if (firstName.isEmpty) {
      showCustomSnackBarRed('enter your first Name ', 'empty field');
    } else if (lastName.isEmpty) {
      showCustomSnackBarRed('enter your last Name ', 'empty field');
    } else if (telegram.isEmpty) {
      showCustomSnackBarRed('enter your telegram ', 'empty field');
    } else if (dio.isEmpty) {
      showCustomSnackBarRed('enter your dio', 'empty field');
    } else if (!GetUtils.isPhoneNumber(phone)) {
      showCustomSnackBarRed('enter number only', 'Not Valid');
    } else if (imageName == '') {
      showCustomSnackBarRed('Add image ', 'empty image');
    } else {
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      AdminUpdateTeacherModel adminUpdateTeacherModel = AdminUpdateTeacherModel(
        img: base64Image,
        lastName: lastName,
        firstName: firstName,
        telegram: telegram,
        phone: int.parse(phone),
        dio: dio,
        id: adminTeacherProfileModel.userTeacher!.id!,
      );

      editTeacher(adminUpdateTeacherModel).then((status) async {
        if (status.isSuccessful!) {
          Get.back();
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> editTeacher(
      AdminUpdateTeacherModel adminUpdateTeacherModel) async {
    ResponseModel responseModel;
    _isLoad = true;
    update();
    Response response = await adminRepo.updateTeacher(adminUpdateTeacherModel);

    if (response.statusCode == 200) {
      _isLoad = false;

      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      update();
    } else {
      _isLoad = false;

      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
    }

    return responseModel;
  }
}
