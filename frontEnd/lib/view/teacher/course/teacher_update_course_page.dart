import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/component/text/big_text.dart';
import '../../../component/button/custom_button.dart';
import '../../../component/dialog/chose_time_dialog.dart';
import '../../../component/dropdown/category_dropdown_widget.dart';
import '../../../component/image/take_image_layout.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/loop/loop_2.dart';
import '../../../logic/Controllers/teacher/teacher_course_controller.dart';
import '../../../utils/colors.dart';

class TeacherUpdateCoursePage extends StatelessWidget {
 const TeacherUpdateCoursePage( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: GetBuilder<TeacherCourseController>(builder: (controller) {
      return controller.isLoaded
          ?  Scaffold(
        body: Loop2(),
      )
          : Scaffold(
              body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  takeImageLayout('course View image'.tr, controller, context,
                      width, height),
                  const SizedBox(
                    height: 20,
                  ),
                  InPutTextFormSchool(
                      icon: Icons.video_label,
                      hintText: controller.courseViewModel.course!.name!,
                      textEditingController: controller.nameController),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Container(
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
                                    labelText: controller.courseViewModel.course!.expected_time_to_finsh!,
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
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButton(
                    buttonText: 'Update'.tr,
                    width: 150,
                    height: 60,
                    radius: 16,
                    onPressed: () {
                        controller.updateMethod(controller);
                    },
                    fontSize: 23,
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ));
    }));
  }
}
