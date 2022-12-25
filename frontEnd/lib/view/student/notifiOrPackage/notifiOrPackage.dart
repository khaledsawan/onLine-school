import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/student/student_profile_controller.dart';
import '../../../component/loop/loop_2.dart';
import '../main/notification/student_notification_page.dart';

class NotifiOrPage extends StatelessWidget {
  const NotifiOrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentProfileController>(builder: (builder) {
      if (builder.isLoaded) {
        return const Loop2();
      } else {
        return builder.studentProfileModel.student!.package == 'null'
            ? const StudentNotificationPage()
            : const StudentNotificationPage();
      }
    });
  }
}
