import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/service/repository/admin%20%20Repo/admin_student_repo.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/admin/admin_filter_model.dart';
import '../../../service/model/admin/admin_student_index_model.dart';
import '../../../service/model/admin/admin_student_profile_model.dart';
import '../../../service/model/admin/admin_student_search_model.dart';

import '../../../service/model/admin/admin_update_student_profile_model.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/name_model.dart';
import '../../../service/model/common model/response_model.dart';

class AdminStudentController extends GetxController {
  late AdminStudentRepo adminRepo;
  AdminStudentController({required this.adminRepo});

  late AdminStudentIndexModel adminStudentIndexModel;
  late AdminStudentSearchModel adminStudentSearchModel;
  late AdminStudentProfileModel adminStudentProfileModel;

  late TextEditingController firstNameController,
      lastNameController,
     // emailController,
    //  passwordController,
      phoneController,
      telegramController,
      dioController;

  bool _isLoad = false;
  get isLoad => _isLoad;

  final PageController _pageController = PageController(viewportFraction: 0.85);
  get pageController => _pageController;
  var currPageValue = 0.0;

  String sortSelected = 'id';
  changeSort(String item) {
    sortSelected = item;
    update();
    getStudentList();
  }

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  //  emailController = TextEditingController();
    telegramController = TextEditingController();
  //  passwordController = TextEditingController();
    dioController = TextEditingController();
    phoneController = TextEditingController();
    getStudentList();
    _pageController.addListener(() {
      currPageValue = _pageController.page!;
      update();
    });
  }

  void setValue() {
    firstNameController.text = adminStudentProfileModel.userStudent!.firstName!;
    lastNameController.text = adminStudentProfileModel.userStudent!.lastName!;
    phoneController.text = adminStudentProfileModel.student!.phone!.toString();
    dioController.text = adminStudentProfileModel.student!.dio!;
    telegramController.text = adminStudentProfileModel.student!.telegram!;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
   // emailController.dispose();
  //  passwordController.dispose();
    telegramController.dispose();
    dioController.dispose();
    phoneController.dispose();
    _pageController.dispose();
  }

  Future<void> getStudentList() async {
    _isLoad = true;
    Response response = await adminRepo
        .getStudentList(FilterModel(filter: 'users.$sortSelected'));
    if (response.statusCode == 200) {
      _isLoad = false;
      adminStudentIndexModel = AdminStudentIndexModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
    }
  }

  Future<List<Students>> getStudentSearch({String? query}) async {
    _isLoad = true;
    Response response =
        await adminRepo.getTeacherListSearch(NameModel(name: query));
    if (response.statusCode == 200) {
      _isLoad = false;
      update();
      adminStudentSearchModel =
          AdminStudentSearchModel.fromJson(response.body!);
      return adminStudentSearchModel.students!;
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
      return [];
    }
  }

  Future<void> viewStudent(int id) async {
    _isLoad = true;
    update();
    Response response = await adminRepo.showStudent(IdModel(id: id));
    if (response.statusCode == 200) {
      _isLoad = false;
      adminStudentProfileModel =
          AdminStudentProfileModel.fromJson(response.body);
      setValue();
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
    }
  }

  Future<void> deleteStudent() async {
    _isLoad = true;
    update();
    Response response = await adminRepo
        .deleteStudent(IdModel(id: adminStudentProfileModel.userStudent!.id!));
    if (response.statusCode == 200) {
      Get.back();
      Get.back();
      getStudentList();
      update();
    } else {
      showCustomSnackBarRed(response.statusText.toString(), 'Error');
      _isLoad = false;
      update();
    }
  }

  updateMethod() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String dio = dioController.text.trim();
    String telegram = telegramController.text.trim();
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
    }
    AdminUpdateStudentProfileModel adminUpdateStudentProfileModel =
        AdminUpdateStudentProfileModel(
      lastName: lastName,
      firstName: firstName,
      telegram: telegram,
      phone: int.parse(phone),
      dio: dio,
      id: adminStudentProfileModel.userStudent!.id!,
    );

    editStudent(adminUpdateStudentProfileModel).then((status) async {
      if (status.isSuccessful!) {
        Get.back();
        Get.back();
        getStudentList();
      } else {
        showCustomSnackBarRed('${status.massage}', 'error');
      }
    });
  }

  Future<ResponseModel> editStudent(
      AdminUpdateStudentProfileModel adminUpdateTeacherModel) async {
    ResponseModel responseModel;
    _isLoad = true;
    update();
    Response response = await adminRepo.updateStudent(adminUpdateTeacherModel);
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
