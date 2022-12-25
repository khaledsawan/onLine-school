import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/common model/login_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/common model/user_signIn_model.dart';
import '../../../service/repository/common repo/auth_repo.dart';

class TeacherLoginController extends GetxController implements GetxService {
  bool isLoad = false;
  late LoginModel loginModel;
  late AuthRepo authRepo;
  late SharedPreferences prefs;
  late TextEditingController emailController, passwordController;

  TeacherLoginController({required this.prefs, required this.authRepo});
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
    update();
    ResponseModel responseModel;
    Response response = await authRepo.loginFunction(userSingInModel);

    if (response.statusCode == 200) {
      isLoad = false;

      responseModel =
          ResponseModel(massage: response.statusText, isSuccessful: true);
      loginModel = LoginModel.fromJson(response.body);
      await authRepo.saveUserToken(loginModel);
      update();
    } else {
      showCustomSnackBarRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
      isLoad = false;
      update();
    }
    return responseModel;
  }
}
