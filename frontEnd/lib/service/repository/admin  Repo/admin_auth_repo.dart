import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/common model/login_model.dart';
import '../../model/common model/user_signIn_model.dart';
import '../../model/common model/user_signUp_model.dart';

class AdminAuthRepo extends GetxService {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;

  AdminAuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> loginFunction(UserSingInModel userLoginModel) async {
    Response response = await apiClient.postData(
        AppConstants.LOGIN_URL, userLoginModel.toJson());
    return response;
  }

  saveUserToken(LoginModel loginModel) async {
    apiClient.token = loginModel.token.toString();
    await sharedPreferences.setString(
        AppConstants.ROLE, loginModel.role.toString());
    await sharedPreferences.setString(
        AppConstants.TOKEN, loginModel.token!.toString());
    apiClient.updateHeaders(loginModel.token!.toString());
  }

  Future<void> saveUserPhoneAndPassword(String email, String password) async {
    await sharedPreferences.setString(AppConstants.EMAIL, email);
    await sharedPreferences.setString(AppConstants.PASSWORD, password);
  }

  bool isAuth() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  String getToken() {
    return sharedPreferences.getString(AppConstants.TOKEN).toString();
  }

  Future<bool> clearUserAuth() async {
    if (await sharedPreferences.remove(AppConstants.TOKEN) &&
        await sharedPreferences.remove(AppConstants.PHONE) &&
        await sharedPreferences.remove(AppConstants.PASSWORD)) {
      apiClient.token = '';
      apiClient.updateHeaders('');
      return true;
    } else {
      return false;
    }
  }
}
