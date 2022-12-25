import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/login_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/student/student_register_model.dart';
import '../../../service/model/student/student_register_model2.dart';
import '../../../service/repository/common repo/auth_repo.dart';

class StudentRegisterController extends GetxController {
  bool _isLoading = false;
  get isLoading=>_isLoading;
  late AuthRepo authRepo;
  late SharedPreferences prefs;

  StudentRegisterController({required this.authRepo, required this.prefs});

  late TextEditingController emailController,
      passwordController,
      firstNameController,
      phoneController,
      lastNameController,
      telegramController,
      dioController;
  @override
  void dispose() async {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    telegramController.dispose();
    dioController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    telegramController = TextEditingController();
    dioController = TextEditingController();
    super.onInit();
  }

  Future<void> loginMethod() async {
    String email = emailController.text.trim();
    String fName = firstNameController.text.trim();
    String lName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String telegram = telegramController.text.trim();
    String dio = dioController.text.trim();
    if (fName.isEmpty) {
      showCustomSnackBarRed('enter your first name ', 'empty field');
    } else if (lName.isEmpty) {
      showCustomSnackBarRed('enter your last name ', 'empty field');
    } else if (email.isEmpty) {
      showCustomSnackBarRed('enter your email ', 'empty field');
    } else if (!email.isEmail) {
      showCustomSnackBarRed('you need to enter email only', 'not email ');
    } else if (phone.isEmpty) {
      showCustomSnackBarRed('enter your phone ', 'empty field');
    } else if (!phone.isPhoneNumber) {
      showCustomSnackBarRed('you need to enter numbers only', 'not phone');
    } else if (password.isEmpty) {
      showCustomSnackBarRed('enter your password ', 'empty field');
    } else if (password.length < 6) {
      showCustomSnackBarRed(
          'short password must more than 8 characters', 'short password');
    } else if (dio.isEmpty) {
      showCustomSnackBarRed('enter your dio ', 'empty field');
    }
    else if (telegram.isEmpty) {
      showCustomSnackBarRed('enter your telegram url ', 'empty field');
    }else if (dio.length < 10) {
      showCustomSnackBarRed('Short Dio', 'More info');
    }  else {
      _isLoading=true;
      update();

      StudentRegisterModel studentRegisterModel = StudentRegisterModel(
          email, password, fName, lName, dio, int.parse(phone), telegram);
      Response response = await authRepo.registerStudent(studentRegisterModel);
      print(response.statusCode);
      if(response.statusCode==200){
        _isLoading=false;
      LoginModel  loginModel = LoginModel.fromJson(response.body);
        await authRepo.saveUserToken(loginModel);
        Get.offAllNamed(AppRoutes.studentmain);
        update();
      }else{
        _isLoading=false;
        showCustomSnackBarRed('check you internet connection', 'error');
        update();
      }
    }
  }
}
