import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/component/dialog/confirm_dialog.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/logic/Controllers/teacher/teacher_course_controller.dart';
import 'package:school/routes/routes.dart';
import 'package:school/utils/AppConstants.dart';
import '../../../component/bottom_sheet/show_bottom_sheet_chose.dart';
import '../../../component/loop/loop_2.dart';
import '../../../utils/colors.dart';
import '../serach/teacher_search_course.dart';

class TeacherCoursesPage extends StatelessWidget {
  const TeacherCoursesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<TeacherCourseController>(builder: (controller) {
      return controller.isLoaded
          ? const Loop2()
          : Scaffold(
              backgroundColor:
                  Get.isDarkMode ? AppColors.mainColor : AppColors.white,
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.teacheraddcoursepage);
                  },
                  focusColor: Colors.blue,
                  backgroundColor: AppColors.hintColor.withOpacity(0.7),
                  child: const Icon(
                    Icons.playlist_add,
                    size: 40,
                  )),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.settingpage);
                                      },
                                      icon: const Icon(
                                        Icons.settings,
                                        size: 30,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showSearch(
                                            context: context,
                                            delegate: TeacherSearchCourse());
                                      },
                                      icon: const Icon(Icons.search_rounded,
                                          size: 30))
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.contactus);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        child: Image.asset(
                                            'images/electronic school.png')),
                                    Text(
                                      'School',
                                      style: GoogleFonts.peralta(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: isDark
                                              ? AppColors.textColor
                                              : AppColors.mainColor),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: () => Get.find<TeacherCourseController>()
                            .getCoursesList(),
                        child: SizedBox(
                          width: width,
                          height: height - 100,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimationLimiter(
                                child: GridView.builder(
                                    itemCount: controller.productList.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              columnCount: 2,
                                              child: ScaleAnimation(
                                                duration: const Duration(
                                                    milliseconds: 900),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                child: GestureDetector(
                                                  onLongPress: () {
                                                    showBottomSheetChose(
                                                        context, () {
                                                      Navigator.pop(context);
                                                      confirmDialog(
                                                          'Are you sure!'.tr,
                                                          AppColors.mainColor,
                                                          Text(
                                                              textAlign:TextAlign.center,
                                                              'when delete the course all his videos well be deleted'
                                                                  .tr),
                                                          () => confirmMethod(
                                                              controller
                                                                  .productList[
                                                                      index]
                                                                  .id!),
                                                          () => deleteMethod);
                                                    }, () {
                                                      Get.find<
                                                              TeacherCourseController>()
                                                          .viewCourse(
                                                              id: controller
                                                                  .productList[
                                                                      index]
                                                                  .id!);
                                                      Get.toNamed(AppRoutes
                                                          .teacherviewCourse);
                                                    }, () {
                                                      Get.find<
                                                              TeacherCourseController>()
                                                          .viewCourse(
                                                              id: controller
                                                                  .productList[
                                                                      index]
                                                                  .id!);
                                                      Get.toNamed(AppRoutes
                                                          .teacherupdatecoursepage);
                                                    });
                                                  },
                                                  onTap: () {
                                                    Get.find<
                                                            TeacherCourseController>()
                                                        .viewCourse(
                                                            id: controller
                                                                .productList[
                                                                    index]
                                                                .id!);
                                                    Get.toNamed(AppRoutes
                                                        .teacherviewCourse);
                                                  },
                                                  child: FadeInAnimation(
                                                    child: isDark
                                                        ? designDark(
                                                            context,
                                                            controller
                                                                .productList[
                                                                    index]
                                                                .img!,
                                                            controller
                                                                .productList[
                                                                    index]
                                                                .name!,
                                                            controller
                                                                .productList[
                                                                    index]
                                                                .id!)
                                                        : designLight(
                                                            context,
                                                            controller
                                                                .productList[
                                                                    index]
                                                                .img!,
                                                            controller
                                                                .productList[
                                                                    index]
                                                                .name!,
                                                            controller
                                                                .productList[
                                                                    index]
                                                                .id!),
                                                  ),
                                                ),
                                              ));
                                    })),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
    });
  }
}

designDark(BuildContext context, String img, String name, int id) {
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
                onPressed: () {
                  showBottomSheetChose(context, () {
                    Navigator.pop(context);
                    confirmDialog(
                        'Are you sure!'.tr,
                        AppColors.mainColor,
                        BigText(
                            textBody:
                                'when delete the course all his videos well be deleted'
                                    .tr),
                        () => confirmMethod(id),
                        () => deleteMethod);
                  }, () {
                    Get.find<TeacherCourseController>().viewCourse(id: id);
                    Get.toNamed(AppRoutes.teacherviewCourse);
                  }, () {
                    Get.find<TeacherCourseController>().viewCourse(id: id);
                    Get.toNamed(AppRoutes.teacherupdatecoursepage);
                  });
                },
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
          textBody: name,
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
      )
    ],
  );
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
                onPressed: () {
                  showBottomSheetChose(context, () {
                    Navigator.pop(context);
                    confirmDialog(
                        'Are you sure!'.tr,
                        AppColors.mainColor,
                        BigText(
                            textBody:
                                'when delete the course all his videos well be deleted'
                                    .tr), () {
                      confirmMethod(id);
                    }, () => deleteMethod);
                  }, () {
                    Get.find<TeacherCourseController>().viewCourse(id: id);
                    Get.toNamed(AppRoutes.teacherviewCourse);
                  }, () {
                    Get.find<TeacherCourseController>().viewCourse(id: id);
                    Get.toNamed(AppRoutes.teacherupdatecoursepage);
                  });
                },
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

confirmMethod(int id) {
  Get.find<TeacherCourseController>().deleteCourse(id: id);
  Get.back();
}

deleteMethod() {
  Get.back();
}
