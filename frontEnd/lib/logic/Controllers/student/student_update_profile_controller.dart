import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/student/student_profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/login_model.dart';
import '../../../service/model/student/student_profile_model.dart';
import '../../../service/model/student/student_register_model.dart';
import '../../../service/model/student/student_register_model2.dart';
import '../../../service/model/student/student_update_profile.model.dart';
import '../../../service/repository/common repo/auth_repo.dart';
import '../../../service/repository/student/student_repo.dart';

class StudentUpdateProfileController extends GetxController {
  bool _isLoading = false;
  get isLoading => _isLoading;
  late StudentRepo studentRepo;

  StudentUpdateProfileController({required this.studentRepo});

  late TextEditingController firstNameController,
      phoneController,
      lastNameController,
      telegramController,
      dioController;

  @override
  void dispose() async {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    telegramController.dispose();
    dioController.dispose();
    super.dispose();
  }

  late StudentProfileController profileController;
  @override
  void onInit() {
    profileController = Get.find<StudentProfileController>();

    phoneController = TextEditingController();
    phoneController.text =
        profileController.studentProfileModel.student!.phone!.toString();

    firstNameController = TextEditingController();
    firstNameController.text =
        profileController.studentProfileModel.user!.firstName!.toString();

    lastNameController = TextEditingController();
    lastNameController.text =
        profileController.studentProfileModel.user!.lastName!.toString();

    telegramController = TextEditingController();
    telegramController.text =
        profileController.studentProfileModel.student!.telegram.toString();

    dioController = TextEditingController();
    dioController.text =
        profileController.studentProfileModel.student!.dio.toString();
    super.onInit();
  }

  Future<void> updateMethod() async {
    String fName = firstNameController.text.trim();
    String lName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String telegram = telegramController.text.trim();
    String dio = dioController.text.trim();
    if (fName.isEmpty) {
      showCustomSnackBarRed('enter your first name ', 'empty field');
    } else if (lName.isEmpty) {
      showCustomSnackBarRed('enter your last name ', 'empty field');
    } else if (phone.isEmpty) {
      showCustomSnackBarRed('enter your phone ', 'empty field');
    } else if (!phone.isPhoneNumber) {
      showCustomSnackBarRed('you need to enter numbers only', 'not phone');
    } else if (dio.isEmpty) {
      showCustomSnackBarRed('enter your dio ', 'empty field');
    } else if (dio.length < 10) {
      showCustomSnackBarRed('Short dio', '');
    } else {
      _isLoading = true;
      update();
      if (telegram.isEmpty) {
        telegram = 'null';
      }
      StudentUpdateProfileModel studentUpdateProfileModel =
          StudentUpdateProfileModel(
              fName, lName, dio, int.parse(phone), telegram);
      Response response =
          await studentRepo.updateProfile(studentUpdateProfileModel);
      print('response.statusCode');
      print(response.statusCode);
      print('response.statusText');
      print(response.statusText);
      if (response.statusCode == 200) {
        _isLoading = false;
        profileController.getProfile();
        Get.back();
        update();
      } else {
        _isLoading = false;
        showCustomSnackBarRed('choke internet connection', 'error');
        update();
      }
    }
  }
}
