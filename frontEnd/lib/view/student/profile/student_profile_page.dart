import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/edgeInsets/padding.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/descriptiontextwidget.dart';
import '../../../component/container/custom_container.dart';
import '../../../component/loop/loop_2.dart';
import '../../../component/text/custom_text_in_container.dart';
import '../../../logic/Controllers/student/student_profile_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppColors.mainColor : AppColors.white,
      appBar: appBar(context, Icons.mode_edit, 'edit profile'.tr, () {
        Get.toNamed(AppRoutes.studentupdateprofile);
      }, '', Icons.adb, () {}, isBack: true),
      body: SafeArea(
        child: GetBuilder<StudentProfileController>(builder: (controller) {
          return controller.isLoaded
              ? const Loop2()
              : SingleChildScrollView(
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: 200,
                          child: Image.asset('images/student.png')),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: padding(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: CustomTextInContainer(
                              text: controller
                                  .studentProfileModel.user!.firstName!,
                              textAlign: TextAlign.center,
                              alignment: Alignment.center,
                              textSize: 18,
                              icon: Icons.person,
                            )),
                            Expanded(
                                child: CustomTextInContainer(
                              text: controller
                                  .studentProfileModel.user!.lastName!,
                              textSize: 18,
                              textAlign: TextAlign.center,
                              alignment: Alignment.center,
                              icon: Icons.family_restroom_outlined,
                            )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller.studentProfileModel.user!.email!,
                          textSize: 18,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          icon: Icons.email,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller.studentProfileModel.student!.phone!
                              .toString(),
                          textSize: 18,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          icon: Icons.phone,
                        ),
                      ),
                      controller.studentProfileModel.student!.telegram == 'null'
                          ? GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.studentupdateprofile);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: CustomTextInContainer(
                                  width: width,
                                  text: '  <Press to Edit profile >'.tr,
                                  textSize: 14,
                                  textAlign: TextAlign.center,
                                  alignment: Alignment.center,
                                  icon: Icons.telegram,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              child: CustomTextInContainer(
                                width: width,
                                text: controller
                                    .studentProfileModel.student!.telegram
                                    .toString(),
                                textSize: 18,
                                textAlign: TextAlign.center,
                                alignment: Alignment.center,
                                icon: Icons.telegram,
                              ),
                            ),
                      controller.studentProfileModel.student!.package == 'null'
                          ? GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.package);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: CustomTextInContainer(
                                  width: width,
                                  text: '  <Press to Change Play >'.tr,
                                  textSize: 14,
                                  textAlign: TextAlign.center,
                                  alignment: Alignment.center,
                                  icon: Icons.verified_rounded,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              child: CustomTextInContainer(
                                width: width,
                                text: controller
                                    .studentProfileModel.student!.package
                                    .toString(),
                                textSize: 18,
                                textAlign: TextAlign.center,
                                alignment: Alignment.center,
                                icon: Icons.verified_rounded,
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 16),
                        child: CustomContainer(
                          alignment: Alignment.topCenter,
                          backgroundColor:
                              isDark ? AppColors.mainColor : AppColors.white,
                          radius: 8,
                          width: width,
                          height: 200,
                          widget: Column(
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.description_outlined),
                                  BigText(
                                    textBody: 'Dio'.tr,
                                    size: 22,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                height: 1,
                                width: width,
                                color: AppColors.hintColor,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: DescriptionTextWidget(
                                    text: controller
                                        .studentProfileModel.student!.dio!),
                              ),
                            ],
                          ),
                        ),
                      ),
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
