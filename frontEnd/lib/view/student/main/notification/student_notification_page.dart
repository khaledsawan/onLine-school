import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/logic/Controllers/student/student_course_controller.dart';
import 'package:school/routes/routes.dart';
import '../../../../logic/Controllers/notifi/notifi_controller.dart';
import '../../../../service/model/notifi/notifi_pref_model.dart';
import '../../../../utils/AppConstants.dart';
import '../../../../utils/colors.dart';

class StudentNotificationPage extends StatelessWidget {
  const StudentNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold
      (
      backgroundColor: isDark?AppColors.mainColor:AppColors.white,
        body: GetBuilder<NotifiController>(
      builder: (controller) {
        return controller.isLoading
            ?const Loop2()
            : SafeArea(
                child: controller.detail.isEmpty
                    ? Center(
                        child: SizedBox(
                          width: 200,
                          child: Image.asset('images/empty notification.jpg'),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListView.builder(
                            itemCount: controller.detail.length,
                            itemBuilder: (context, index) {
                              return design(isDark, controller, index);
                            }),
                      ),
              );
      },
    ));
  }
}

design(bool idDark, NotifiController controller, int index) {
  NotifiPrefModel notifi =
      NotifiPrefModel.fromJson(json.decode(controller.detail[index]));
  return Container(
    padding: const EdgeInsets.all(4.0),
    margin: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
          color: idDark ? AppColors.courseColor : Colors.blue[50],
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(

        onTap: () {
          Get.toNamed(AppRoutes.studentteachercourses);
          Get.find<StudentCourseController>()
              .getTeacherCoursesList(notifi.teacher_id!);
        },

        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(AppConstants.BASE_URL + notifi.image!),
        ),
        title: Text(
          notifi.title!,
          textScaleFactor: 1.5,
        ),
        trailing: GestureDetector(
            onTap: () {
              controller.deleteFromList(index);
            },
            child: const Icon(
              Icons.done,
              color: AppColors.blue,
            )),

        subtitle: Text(notifi.body!),
        // selected: true,
      ),
    ),
  );
}
