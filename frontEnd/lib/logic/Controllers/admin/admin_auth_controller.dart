import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/login_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/common model/user_signIn_model.dart';
import '../../../service/repository/admin  Repo/admin_auth_repo.dart';
import '../../../service/repository/common repo/auth_repo.dart';

class AdminAuthController extends GetxController implements GetxService {
  bool isLoad = false;
  late LoginModel loginModel;
  late AdminAuthRepo authRepo;
  late SharedPreferences prefs;
  late TextEditingController emailController, passwordController;

  AdminAuthController({required this.prefs, required this.authRepo});
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

  Future<ResponseModel> loginFunction(UserSingInModel userSingInModel) async {
    isLoad = true;
    ResponseModel responseModel;
    Response response = await authRepo.loginFunction(userSingInModel);
    if (response.statusCode == 200) {
      isLoad = false;
      responseModel =
          ResponseModel(massage: response.statusText, isSuccessful: true);
      loginModel = LoginModel.fromJson(response.body);
      await authRepo.saveUserToken(loginModel);
    } else {
      showCustomSnackBarRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    isLoad = false;
    update();
    return responseModel;
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
          if (loginModel.role == 'admin') {
            Get.offAllNamed(AppRoutes.adminmainpage);
          }
        }
      });
    }
  }
}
