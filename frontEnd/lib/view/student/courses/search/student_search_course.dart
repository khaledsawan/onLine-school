import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/student/student_course_controller.dart';
import 'package:school/logic/Controllers/teacher/teacher_course_controller.dart';
import '../../../../component/container/custom_container.dart';
import '../../../../component/image/image_in_container.dart';
import '../../../../component/size/size.dart';
import '../../../../component/text/big_text.dart';
import '../../../../routes/routes.dart';
import '../../../../service/model/teacher model/teacher_search_model.dart';
import '../../../../utils/AppConstants.dart';
import '../../../../utils/colors.dart';


class StudentSearchCourse extends SearchDelegate {
  design(BuildContext context, SearchData data) {
    return InkWell(
        onTap: () {
          Get.find<
              TeacherCourseController>()
              .viewCourse(
              id: data.id!).then((value) =>  Get.toNamed(AppRoutes.teacherviewCourse));
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: CustomContainer(
            border: 0,
            height: 125,
            radius: 8,
            backgroundColor: Get.isDarkMode?AppColors.mainColor:AppColors.white,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 85,
                      width: width(context) * 0.60,
                      padding:
                      const EdgeInsets.only(left: 4.0, top: 8, right: 4),
                      child: BigText(
                        textAlign: TextAlign.center,
                        textBody: data.name!,
                        maxLine: 2,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(data.img!),
                      backgroundColor: Colors.transparent,
                    )
                  ],
                ),
                ImageInContainer(
                  image: '${AppConstants.BASE_URL}/storage${data.img!}',
                  height: 125,
                  width: width(context) * 0.34,
                )
              ],
            ),
          ),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<SearchData>>(
        future:
        Get.find<StudentCourseController>().getCourseSearch(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<SearchData>? data = snapshot.data;
          return AnimationLimiter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: -300,
                      verticalOffset: -850,
                      child: design(context, data[index])),
                );
              },
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: SizedBox(width: 200, child: Image.asset('images/empty box.png')),
    );
  }
}
