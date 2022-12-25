import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/logic/Controllers/admin/admin_category_controller.dart';
import 'package:school/logic/Controllers/teacher/teacher_course_controller.dart';
import 'package:school/logic/Controllers/teacher/teacher_login_controller.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../component/button/custom_button.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../logic/Controllers/teacher/teacher_profile_controller.dart';
import '../../../routes/routes.dart';
import '../../../service/model/common model/user_signIn_model.dart';
import '../../../utils/colors.dart';

class TeacherLoginPage extends StatelessWidget {
  const TeacherLoginPage({Key? key}) : super(key: key);

  void _loginMethod(TeacherLoginController loginController) {
    String email = loginController.emailController.text.trim();
    String password = loginController.passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBarRed('enter your email'.tr, 'empty field'.tr);
    } else if (!email.isEmail) {
      showCustomSnackBarRed('you need to enter email only'.tr, 'not email'.tr);
    } else if (password.isEmpty) {
      showCustomSnackBarRed('enter your password'.tr, 'empty field'.tr);
    } else if (password.length < 6) {
      showCustomSnackBarRed(
          'short password must more than 8 characters'.tr, 'short password'.tr);
    } else {
      UserSingInModel userLoginModel = UserSingInModel(email, password);
      loginController.loginFunction(userLoginModel).then((status) async {
        if (status.isSuccessful!) {
          Get.find<TeacherProfileController>().getProfile();
          Get.find<AdminCategoryController>().getCategoryList().then((value) {
            Get.find<TeacherCourseController>().getCoursesList();
            Get.offAllNamed(AppRoutes.teachercourses);
          });
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
        body: GetBuilder<TeacherLoginController>(builder: (controller) {
      return controller.isLoad
          ? const Loop2()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width * 0.5,
                    height: height * 0.3,
                    child: Image.asset('images/teacher login2.png'),
                  ),
                  InPutTextFormSchool(
                      icon: Icons.email,
                      hintText: 'examble@gmail.com',
                      textEditingController: controller.emailController),
                  const SizedBox(
                    height: 25,
                  ),
                  InPutTextFormSchool(
                      isPassword: true,
                      icon: Icons.password,
                      hintText: 'your password'.tr,
                      textEditingController: controller.passwordController),
                  Container(
                      margin: const EdgeInsets.only(left: 4, right: 4),
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 10),
                      alignment: Alignment.topLeft,
                      child: SmallText(
                        textBody: 'forget password ?'.tr,
                        size: 14,
                        color: AppColors.blue,
                      )),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButton(
                    buttonText: 'Login'.tr,
                    width: 150,
                    height: 60,
                    radius: 16,
                    onPressed: () {
                      _loginMethod(controller);
                    },
                    fontSize: 23,
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            );
    })));
  }
}
