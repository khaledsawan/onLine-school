import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../component/appbar/appbar.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/loop/loop_2.dart';
import '../../../logic/Controllers/student/student_update_profile_controller.dart';
import '../../../utils/colors.dart';

class StudentUpdateProfilePage extends StatelessWidget {
  const StudentUpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Icons.save, 'save changes'.tr, () {
        Get.find<StudentUpdateProfileController>().updateMethod();
      }, '', Icons.adb, () {},isBack:true),
      backgroundColor: Get.isDarkMode ? AppColors.mainColor : AppColors.white,
      body:SafeArea(
        child: GetBuilder<StudentUpdateProfileController>(builder: (controller){
          return controller.isLoading?  const Loop2():SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
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
                    isNumber: true,
                    icon: Icons.phone_android,
                    hintText: '09********',
                    textEditingController: controller.phoneController),
                const SizedBox(
                  height: 15,
                ),
                InPutTextFormSchool(
                    icon: Icons.telegram,
                    hintText: 'telegram'.tr,
                    textEditingController: controller.telegramController),
                const SizedBox(
                  height: 15,
                ),
                InPutTextFormSchool(
                    maxLine: 7,
                    icon: Icons.adb,
                    hintText: 'Dio'.tr,
                    textEditingController: controller.dioController),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  }

