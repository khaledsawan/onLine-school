import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/descriptiontextwidget.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../../component/container/custom_container.dart';
import '../../../component/dialog/confirm_dialog.dart';
import '../../../component/loop/loop_2.dart';
import '../../../component/text/custom_text_in_container.dart';
import '../../../component/text/small_text.dart';
import '../../../logic/Controllers/admin/admin_student_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';

class AdminShowStudentPage extends StatelessWidget {
  const AdminShowStudentPage({Key? key}) : super(key: key);
  deleteMethod() {
    print('delete');
    Get.find<AdminStudentController>().deleteStudent();
  }

  cancelMethod() {
    print('back');
    Get.back();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<AdminStudentController>(builder: (controller) {
      return controller.isLoad
          ? const SafeArea(
              child: Center(
              child: Loop2(),
            ))
          : Scaffold(
              appBar: appBar(
                  context, Icons.delete, 'delete', () {
                confirmDialog(
                    'Are you sure!',
                    AppColors.mainColor,
                    SmallText(
                      height: 1,
                      maxLine: 2,
                      textAlign: TextAlign.center,
                      textBody:
                      'when delete the user all his information well be deleted.',
                      size: 14,
                    ), () {
                  deleteMethod();
                }, () {
                  cancelMethod();
                });
              }, '', Icons.mode_edit, () {
Get.toNamed(AppRoutes.adminstudentupdateprofilepage);
              },
                  isBack: true),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 150,
                        child: Image.asset('images/student.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminStudentProfileModel.userStudent!.firstName!,
                          textSize: 18,
                          textAlign: TextAlign.start,
                          alignment: Alignment.center,
                          icon: Icons.person,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminStudentProfileModel.userStudent!.lastName!,
                          textSize: 18,
                          textAlign: TextAlign.start,
                          alignment: Alignment.center,
                          icon: Icons.family_restroom,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminStudentProfileModel.student!.package!,
                          textSize: 18,
                          textAlign: TextAlign.start,
                          alignment: Alignment.center,
                          icon: Icons.verified_rounded,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomTextInContainer(
                          width: width,
                          text:controller
                              .adminStudentProfileModel.userStudent!.email!,
                          textSize: 18,
                          textAlign: TextAlign.start,
                          alignment: Alignment.center,
                          icon: Icons.email,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminStudentProfileModel.student!.phone!.toString(),
                          textSize: 18,
                          textAlign: TextAlign.start,
                          alignment: Alignment.center,
                          icon: Icons.phone,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminStudentProfileModel.student!.telegram!,
                          textSize: 18,
                          textAlign: TextAlign.start,
                          alignment: Alignment.center,
                          icon: SimpleIcons.telegram,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 8),
                        child: CustomContainer(
                          alignment: Alignment.topCenter,
                          backgroundColor:
                              isDark ? AppColors.mainColor : AppColors.white,
                          radius: 8,
                          width: width,
                          height: 200,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.description_outlined),
                                    BigText(
                                      textBody: ' Dio',
                                      size: 22,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                height: 1,
                                width: width,
                                color: AppColors.hintColor,
                              ),
                               DescriptionTextWidget(
                                  text:
                                  controller
                                      .adminStudentProfileModel.student!.dio!, ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 150,
                        child: Image.asset('images/average.png',),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
