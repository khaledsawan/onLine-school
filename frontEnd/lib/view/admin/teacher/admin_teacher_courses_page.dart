import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/component/dialog/confirm_dialog.dart';
import 'package:school/component/text/big_text.dart';
import '../../../component/bottom_sheet/show_bottom_sheet_chose.dart';
import '../../../utils/colors.dart';
import '../../contact_us/about_us_page.dart';
import '../../teacher/course/teacher_course_view_page.dart';
import '../../teacher/course/teacher_update_course_page.dart';
import '../../teacher/profile/teacher_profile_page.dart';


class AdminTeacherCoursesPage extends StatelessWidget {
  const AdminTeacherCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
               // Get.to(TeacherAddCoursePage());
              },
              focusColor: Colors.blue,
              backgroundColor: AppColors.hintColor.withOpacity(0.3),
              child: const Icon(
                Icons.playlist_add,
                size: 40,
              )),
          body: SingleChildScrollView(
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
                                  Get.to(TeacherProfilePage());
                                },
                                icon: const Icon(
                                  Icons.person,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {
                                  Get.to(TeacherProfilePage());
                                },
                                icon: const Icon(Icons.search_rounded, size: 30))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(AboutUsPage());
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 60,
                                  child:
                                  Image.asset('images/electronic school.png')),
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
                SizedBox(
                  width: width,
                  height: height - 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AnimationLimiter(
                        child: GridView.builder(
                            itemCount: 3,
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
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: GestureDetector(
                                      onTap: () {
                                      //  Get.to(TeacherStudentCoursePage());
                                      },
                                      child: FadeInAnimation(
                                        child: designDark(context),
                                      ),
                                    ),
                                  ));
                            })),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

designDark(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.4 - 70,
              width: Get.width * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/flutter-best-practices.png'))),
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
                        'Are you sure!',
                        AppColors.mainColor,
                        BigText(
                            textBody:
                            'when delete the user all his information well be deleted'),
                            () => confirmMethod,
                            () => deleteMethod);
                  }, () {
                 //   Get.to(TeacherStudentCoursePage());
                  }, () {
                  //  Get.to(TeacherUpdateCoursePage());
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
          textBody: 'dart course 2022 null safety 2022 null safety',
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
      )
    ],
  );
}

designLight(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.4 - 70,
              width: Get.width * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/flutter-best-practices.png'))),
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
                        'Are you sure!',
                        AppColors.mainColor,
                        BigText(
                            textBody:
                            'when delete the user all his information well be deleted'),
                            () => confirmMethod,
                            () => deleteMethod);
                  }, () {
                   // Get.to(TeacherStudentCoursePage());
                  }, () {
              //      Get.to(TeacherUpdateCoursePage());
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
          textBody: 'dart course 2022 null safety 2022 null safety',
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
      )
    ],
  );;
}

confirmMethod() {
  print('confirm');

  Get.back();
}

deleteMethod() {
  print('delete');
  Get.back();
}
