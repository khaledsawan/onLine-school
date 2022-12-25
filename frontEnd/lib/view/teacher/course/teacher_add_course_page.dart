import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/text/big_text.dart';
import '../../../component/dialog/chose_time_dialog.dart';
import '../../../component/dropdown/category_dropdown_widget.dart';
import '../../../component/image/take_image_layout.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/loop/loop_animation.dart';
import '../../../logic/Controllers/teacher/teacher_course_controller.dart';
import '../../../utils/colors.dart';

class TeacherAddCoursePage extends StatelessWidget {
  const TeacherAddCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      appBar: appBar(context, Icons.save, '', (){
           Get.find<TeacherCourseController>().saveMethod();
      }, '', Icons.adb, (){},isBack: true),
        body: GetBuilder<TeacherCourseController>(builder: (controller) {
      return controller.isLoaded
          ? const LoopAnimation()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  takeImageLayout(
                      'course View image'.tr, controller, context, width, height),
                  const SizedBox(
                    height: 20,
                  ),
                  InPutTextFormSchool(
                      icon: Icons.video_label,
                      hintText: 'List View Name'.tr,
                      textEditingController: controller.nameController),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CategoryDropDownWidget(controller: controller),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: GestureDetector(
                              onTap: () {
                                ChoseTimeDialog('Expected Time To Finish'.tr,
                                    AppColors.mainColor, controller);
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15.0),
                                    labelStyle:
                                        const TextStyle(color: AppColors.blue),
                                    labelText: 'Expected Time To Finish'.tr,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.border),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                                child: BigText(
                                    textBody: DateFormat('  yyyy-MM-dd')
                                        .format(controller.selectedDate)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
    })));
  }
}
