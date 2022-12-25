import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/routes/routes.dart';
import 'package:school/service/model/student/student_courses_model.dart';
import '../../../../component/size/size.dart';
import '../../../../component/text/big_text.dart';
import '../../../../logic/Controllers/student/student_course_controller.dart';
import '../../../../utils/AppConstants.dart';
import '../../../../utils/colors.dart';
import '../../courses/search/student_search_course.dart';

class StudentCoursesPage extends StatelessWidget {
  const StudentCoursesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?AppColors.mainColor:AppColors.white,
      appBar: appBar(
          context,
          Icons.search,
          'search'.tr,
          () {
            showSearch(context: context, delegate: StudentSearchCourse());
          },
          '',
          Icons.sort_outlined,
          () {
            Get.find<StudentCourseController>().changeSort();
          }),
      body: SafeArea(
          child: GetBuilder<StudentCourseController>(builder: (controller) {
        return controller.isLoaded
            ? const Loop2()
            : RefreshIndicator(
                child: controller.productList.isEmpty
                    ? Center(
                        child: SizedBox(
                          width: 200,
                          child: Image.asset('images/empty course.png'),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => controller.getCoursesList(),
                        child: ListView.builder(
                          dragStartBehavior: controller.dragStartBehavior,
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.productList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return design(
                                context, controller.productList[index]);
                          },
                        ),
                      ),
                onRefresh: () => controller.getCoursesList());
      })),
    );
  }
}

design(BuildContext context, Courses courses) {
  return InkWell(
    onTap: () {
      Get.toNamed(AppRoutes.studentcoursepage);
      Get.find<StudentCourseController>().viewCourse(id: courses.id!);
    },
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      width: width(context),
      height: 345,
      child: Column(
        children: [
          Container(
            height: 250,
            width: width(context),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                    image:
                        NetworkImage('${AppConstants.BASE_URL}${courses.img!}'),
                    fit: BoxFit.fill)),
          ),
          Container(
            width: width(context),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 2.0,
                    color: AppColors.border,
                    style: BorderStyle.solid),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: width(context) - 74,
                        child: BigText(
                          maxLine: 2,
                          textBody: courses.name!,
                          size: 20,
                          textOverflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width(context) - 74,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SmallText(size: 16, textBody: 'Subject: '),
                              SmallText(size: 16, textBody: courses.category!),
                            ],
                          ),
                          // const SizedBox(
                          //   width: 16,
                          // ),
                          SmallText(
                              size: 16,
                              textBody: 'Views: ${courses.viewerQuntity!}'),
                          // const SizedBox(
                          //   width: 16,
                          // ),
                          SmallText(
                              size: 16,
                              textBody: 'Lessons: ${courses.numberOfVideos!}'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.mainColor,
                  backgroundImage: NetworkImage(
                    '${AppConstants.BASE_URL}${courses.teacherImage!}',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
