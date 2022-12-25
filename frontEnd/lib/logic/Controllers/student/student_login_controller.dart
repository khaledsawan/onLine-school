import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/student/student_profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/login_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/common model/user_signIn_model.dart';
import '../../../service/repository/common repo/auth_repo.dart';

class StudentLoginController extends GetxController implements GetxService {
  bool isLoad = false;
  late LoginModel loginModel;
  late AuthRepo authRepo;
  late SharedPreferences prefs;
  late TextEditingController emailController, passwordController;

  StudentLoginController({required this.prefs, required this.authRepo});
  @override
  void dispose() async {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void loginMethod() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBarRed('enter your email ', 'empty field');
    } else if (!email.isEmail) {
      showCustomSnackBarRed('you need to enter email only', 'not email ');
    } else if (password.isEmpty) {
      showCustomSnackBarRed('enter your password ', 'empty field');
    } else if (password.length < 6) {
      showCustomSnackBarRed(
          'short password must more than 6 characters', 'short password');
    } else {
      UserSingInModel userLoginModel = UserSingInModel(email, password);
      loginFunction(userLoginModel).then((status) async {
        if (status.isSuccessful!) {
          if (loginModel.role == 'student') {
            Get.offAllNamed(AppRoutes.studentmain);
          }
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> loginFunction(UserSingInModel userSingInModel) async {
    isLoad = true;
    update();
    ResponseModel responseModel;
    Response response = await authRepo.loginFunction(userSingInModel);
    if (response.statusCode == 200) {
      responseModel =
          ResponseModel(massage: response.statusText, isSuccessful: true);
      loginModel = LoginModel.fromJson(response.body);
      await authRepo.saveUserToken(loginModel);
      Get.find<StudentProfileController>().getProfile();
      isLoad = false;
      update();
    } else {
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
      isLoad = false;
      update();
    }

    return responseModel;
  }
}
