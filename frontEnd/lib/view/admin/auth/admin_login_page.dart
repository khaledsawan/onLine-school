import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../component/button/custom_button.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/loop/loop_animation.dart';
import '../../../component/text/big_text.dart';
import '../../../logic/Controllers/admin/admin_auth_controller.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(child:
    Scaffold(body: GetBuilder<AdminAuthController>(builder: (controller) {
      return controller.isLoad
          ? const LoopAnimation()
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            BigText(textBody: 'Login',size: 60,fontWeight: FontWeight.bold,),
            const  SizedBox(height: 80,),

            InPutTextFormSchool(
                icon: Icons.email,
                hintText: 'examble@gmail.com',
                textEditingController: controller.emailController),
            const SizedBox(
              height: 20,
            ),
            InPutTextFormSchool(
                isPassword: true,
                icon: Icons.password,
                hintText: 'your password'.tr,
                textEditingController: controller.passwordController),

            const SizedBox(
              height: 80,
            ),
            CustomButton(
              buttonText: 'Continue'.tr,
              width: 150,
              height: 60,
              radius: 16,
              onPressed: () {
                controller.loginMethod();
              },
              fontSize: 24,
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
