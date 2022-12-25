import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/image/take_image_layout.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/logic/Controllers/admin/admin_teacher_controller.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../utils/colors.dart';

class AdminTeacherUpdateProfilePage extends StatelessWidget {
  const AdminTeacherUpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<AdminTeacherController>(builder: (controller) {
      return controller.isLoad
          ? const SafeArea(child: Loop2())
          : Scaffold(
              backgroundColor:
                  Get.isDarkMode ? AppColors.mainColor : AppColors.white,
              appBar: appBar(context, Icons.save, 'save', () {
                controller.updateMethod();
              }, '', Icons.adb, () {}, isBack: true),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: takeImageLayout('teacher profile image',
                            controller, context, width, height),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InPutTextFormSchool(
                          icon: Icons.person,
                          hintText: 'first name',
                          textEditingController:
                              controller.firstNameController),
                      const SizedBox(
                        height: 15,
                      ),
                      InPutTextFormSchool(
                          icon: Icons.family_restroom,
                          hintText: 'last name',
                          textEditingController: controller.lastNameController),
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
                          icon: Icons.telegram,
                          hintText: 'user name',
                          textEditingController: controller.telegramController),
                      const SizedBox(
                        height: 15,
                      ),

                      InPutTextFormSchool(
                          maxLine: 8,
                          icon: Icons.adb,
                          hintText: 'dio'.tr,
                          textEditingController: controller.dioController),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ));
    });
  }
}
