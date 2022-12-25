import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/dialog/confirm_dialog.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/descriptiontextwidget.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/logic/Controllers/admin/admin_teacher_controller.dart';
import 'package:school/logic/Controllers/admin/admin_teacher_course_controller.dart';
import '../../../component/container/custom_container.dart';
import '../../../component/image/page_view_image.dart';
import '../../../component/text/custom_text_in_container.dart';
import '../../../routes/routes.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors.dart';


class AdminTeacherProfilePage extends StatelessWidget {
  const AdminTeacherProfilePage({Key? key}) : super(key: key);
  deleteMethod() {
    Get.find<AdminTeacherController>().deleteTeacher();
  }

  cancelMethod() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<AdminTeacherController>(builder: (controller) {
      return controller.isLoad
          ? const SafeArea(
              child: Loop2(),
            )
          : Scaffold(
              appBar: appBar(
                  context,
                  Icons.delete_forever,
                  'delete',
                  () {
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
                  },
                  '',
                  Icons.edit,
                  () {
                    Get.toNamed(AppRoutes.adminteacherupdatepage);
                  },
                  isBack: true),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: width * 0.353,
                          backgroundColor: AppColors.hintColor,
                          child: CircleAvatar(
                            radius: width * 0.35,
                            backgroundImage: NetworkImage(
                                '${AppConstants.BASE_URL}${controller.adminTeacherProfileModel.teacher!.img!}'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SmallText(
                            textBody:
                                'view ${controller.adminTeacherProfileModel.teacher!.viewerQuntity}',
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminTeacherProfileModel.userTeacher!.firstName!,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          textSize: 18,
                          icon: Icons.person,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminTeacherProfileModel.userTeacher!.lastName!,
                          textSize: 18,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          icon: Icons.family_restroom_outlined,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminTeacherProfileModel.userTeacher!.email!,
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
                          text: controller
                              .adminTeacherProfileModel.teacher!.phone!
                              .toString(),
                          textSize: 18,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          icon: Icons.phone,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomTextInContainer(
                          width: width,
                          text: controller
                              .adminTeacherProfileModel.teacher!.telegram!
                              .toString(),
                          textSize: 18,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          icon: Icons.telegram,
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
                          height: 230,
                          widget: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.description),
                                  BigText(
                                    textBody: 'Dio',
                                    size: 20,
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
                              DescriptionTextWidget(
                                text: controller
                                    .adminTeacherProfileModel.teacher!.dio!
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      controller
                              .adminTeacherProfileModel.teacherCourses!.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              width: width,
                              height: height * 0.32,
                              child: PageView.builder(
                                  controller: controller.pageController,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.adminTeacherProfileModel
                                      .teacherCourses!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.find<AdminTeacherCourseController>()
                                            .viewCourse(
                                                id: controller
                                                    .adminTeacherProfileModel
                                                    .teacherCourses![index]
                                                    .id!);
                                        Get.toNamed(AppRoutes
                                            .adminviewteachercoursepage);
                                      },
                                      child: pageViewImage(
                                          index,
                                          controller,
                                          controller.adminTeacherProfileModel
                                              .teacherCourses![index]),
                                    );
                                  }),
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
