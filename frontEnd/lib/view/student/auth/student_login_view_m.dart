import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/small_text.dart';
import '../../../component/button/custom_button.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../logic/Controllers/student/student_login_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';

class StudentLoginViewM extends StatelessWidget {
  const StudentLoginViewM({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(child:
        Scaffold(body: GetBuilder<StudentLoginController>(builder: (controller) {
      return controller.isLoad
          ?  const Loop2()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          height: height * 0.3,
                          child: Image.asset('images/student login2.png'),
                        ),
                        Positioned(
                          left: width * 0.15,
                          top: height * 0.3 / 5,
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
                      controller.loginMethod();
                    },
                    fontSize: 23,
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4, right: 4),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          'dont have account?'.tr,
                          style: const TextStyle(
                              color: AppColors.hintColor, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.registerstdeunt);
                          },
                          child:  Text(
                            'SignUp'.tr,
                            style: const TextStyle(
                                fontSize: 19,
                                color: AppColors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
    })));
  }
}
