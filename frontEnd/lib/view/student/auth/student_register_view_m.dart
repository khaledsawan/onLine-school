import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../component/button/custom_button.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/loop/loop_2.dart';
import '../../../logic/Controllers/student/student_register_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';

class StudentRegisterViewM extends StatelessWidget {
  const StudentRegisterViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(child: Scaffold(
        body: GetBuilder<StudentRegisterController>(builder: (controller) {
      return controller.isLoading
          ? const Loop2()
          : Scrollbar(
              thickness: 4, //width of scrollbar
              radius: const Radius.circular(20), //corner radius of scrollbar
              scrollbarOrientation: ScrollbarOrientation.right,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            height: height * 0.29,
                            child: Image.asset('images/student login2.png'),
                          ),
                          Positioned(
                            left: width * 0.15,
                            top: height * 0.27 / 5,
                            child: Transform.rotate(
                              angle: 3.14 * 1.95,
                              child: Container(
                                width: width * 0.18,
                                height: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        opacity: 0.8,
                                        image: AssetImage('images/hit.png'))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Education is a passport to the future'.tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.courgette(
                            fontSize: 22,
                            color: isDark
                                ? AppColors.textColor
                                : AppColors.mainColor),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InPutTextFormSchool(
                        icon: Icons.person,
                        hintText: 'first name'.tr,
                        textEditingController: controller.firstNameController),
                    const SizedBox(
                      height: 15,
                    ),
                    InPutTextFormSchool(
                        icon: Icons.family_restroom,
                        hintText: 'last name'.tr,
                        textEditingController: controller.lastNameController),
                    const SizedBox(
                      height: 15,
                    ),
                    InPutTextFormSchool(
                        icon: Icons.email,
                        hintText: 'examble@gmail.com',
                        textEditingController: controller.emailController),
                    const SizedBox(
                      height: 15,
                    ),
                    InPutTextFormSchool(
                        isNumber: true,
                        icon: Icons.phone_android,
                        hintText: '09********',
                        textEditingController: controller.phoneController),
                    const SizedBox(
                      height: 15,
                    ),
                    InPutTextFormSchool(
                        isPassword: true,
                        icon: Icons.password,
                        hintText: 'your password'.tr,
                        textEditingController: controller.passwordController),
                    const SizedBox(
                      height: 15,
                    ),
                    InPutTextFormSchool(
                        icon: Icons.person,
                        hintText: 'telegram'.tr,
                        textEditingController: controller.telegramController),
                    const SizedBox(
                      height: 15,
                    ),
                    InPutTextFormSchool(
                        maxLine: 6,
                        icon: Icons.adb,
                        hintText: 'Dio'.tr,
                        textEditingController: controller.dioController),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                      buttonText: 'SignUp'.tr,
                      width: 150,
                      height: 60,
                      radius: 16,
                      onPressed: () {
                        controller.loginMethod();
                      },
                      fontSize: 23,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: width,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You have account?'.tr,
                            style: const TextStyle(
                                color: AppColors.hintColor, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.loginstudent);
                            },
                            child: Text(
                              'SignIn'.tr,
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
    })));
  }
}
