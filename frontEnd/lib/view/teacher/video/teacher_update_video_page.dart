import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:school/component/inputtextform/input_text_without_border.dart';
import '../../../component/dialog/chose_time_dialog.dart';
import '../../../component/image/take_image_layout.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/text/big_text.dart';
import '../../../logic/Controllers/teacher/teacher_video_controller.dart';
import '../../../utils/colors.dart';

class TeacherUpdateVideoPage extends StatelessWidget {
  const TeacherUpdateVideoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(
          context,
          Icons.save,
          'save'.tr,
          () {
      // Get.find<TeacherVideoController>().updateVideo(teacherVideoModel)  ;
          },
          '',
          Icons.adb,
          () {},isBack: true),
      body: GetBuilder<TeacherVideoController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              takeImageLayout(
                  'course View image'.tr, controller, context, width, height),
              const SizedBox(
                height: 10,
              ),
              InPutTextFormSchool(
                  icon: Icons.link,
                  hintText: '',
                  textEditingController: controller.urlController),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        BigText(textBody: 'is Intro'.tr),
                        CupertinoSwitch(
                          value: controller.isIntro,
                          onChanged: (value) {
                            controller.isIntroMethod(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
              InPutTextWithOutBorder(
                  textStyle: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                  hintText: 'Title'.tr,
                  hintStyle: const TextStyle(fontSize: 28),
                  maxLine: 2,
                  textEditingController: controller.titleController),
              Theme.of(context).brightness == Brightness.dark
                  ? Image.asset('images/line.png')
                  : Image.asset('images/line2.png'),
              InPutTextWithOutBorder(
                  textStyle: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                  hintText: 'description'.tr,
                  maxLine: 12,
                  textEditingController: controller.descriptionController),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        );
      }),
    ));
  }
}
