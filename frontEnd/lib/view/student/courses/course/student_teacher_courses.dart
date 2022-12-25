import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/service/model/student/student_teacher_profile_model.dart';
import '../../../../component/text/big_text.dart';
import '../../../../logic/Controllers/student/student_course_controller.dart';
import '../../../../utils/AppConstants.dart';
import '../../../../utils/colors.dart';

class StudentTeacherCourses extends StatelessWidget {
  const StudentTeacherCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Get.isDarkMode?AppColors.mainColor:AppColors.white,
      appBar: appBar(context, Icons.adb, 'tooltip', () {}, '', Icons.adb, () {},
          isBack: true),
      body: SafeArea(
        child: GetBuilder<StudentCourseController>(builder: (controller) {
          return controller.isLoaded
              ? const Loop2()
              : RefreshIndicator(
                  onRefresh: () => controller.getTeacherCoursesList(
                      controller.studentTeacherProfileModel.userteacher!.id!),
                  child: SizedBox(
                    width: width,
                    height: height - 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimationLimiter(
                          child: GridView.builder(
                              itemCount: controller.studentTeacherProfileModel
                                  .teacherCourses!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 500),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      duration:
                                          const Duration(milliseconds: 900),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Get.find<
                                          //     TeacherCourseController>()
                                          //     .viewCourse(
                                          //     id: controller
                                          //         .productList[index]
                                          //         .id!);
                                          // Get.toNamed(
                                          //     AppRoutes.teacherviewCourse);
                                        },
                                        child: FadeInAnimation(
                                          child: isDark
                                              ? designDark(controller
                                                  .studentTeacherProfileModel
                                                  .teacherCourses![index])
                                              : designLight(
                                                  context,
                                                  controller
                                                      .productList[index].img!,
                                                  controller
                                                      .productList[index].name!,
                                                  controller
                                                      .productList[index].id!),
                                        ),
                                      ),
                                    ));
                              })),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

designLight(BuildContext context, String img, String name, int id) {
  return Column(
    children: [
      Expanded(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.4 - 70,
              width: Get.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('${AppConstants.BASE_URL}$img'))),
              child: const Icon(
                Icons.playlist_play_outlined,
                size: 80,
                color: AppColors.iconColor,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: 30,
                ))
          ],
        ),
      ),
      Container(
        width: Get.width * 0.4,
        height: 50,
        padding: const EdgeInsets.all(2),
        child: BigText(
          textBody: name,
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
      )
    ],
  );
  ;
}

designDark(TeacherCourses teacherCourses) {
  return Column(
    children: [
      Expanded(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.4 - 70,
              width: Get.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          AppConstants.BASE_URL + teacherCourses.img!))),
              child: const Icon(
                Icons.playlist_play_outlined,
                size: 80,
                color: AppColors.iconColor,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: 30,
                ))
          ],
        ),
      ),
      Container(
        width: Get.width * 0.4,
        height: 50,
        padding: const EdgeInsets.all(4),
        child: BigText(
          textBody: teacherCourses.name!,
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
      )
    ],
  );
}
