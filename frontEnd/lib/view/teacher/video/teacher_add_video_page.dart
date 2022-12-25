import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:school/component/inputtextform/input_text_without_border.dart';
import '../../../component/image/take_image_layout.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/text/big_text.dart';
import '../../../logic/Controllers/teacher/teacher_video_controller.dart';

class TeacherAddVideoPage extends StatelessWidget {
  const TeacherAddVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: GetBuilder<TeacherVideoController>(builder: (controller) {
      return controller.isLoaded
          ? const Scaffold()
          : Scaffold(
              appBar: appBar(context, Icons.save, 'save'.tr, () {
                controller.saveMethod(controller);
              }, '', Icons.adb, () {}, isBack: true),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    takeImageLayout(
                        'video View image'.tr, controller, context, width, height),
                    const SizedBox(
                      height: 20,
                    ),
                    InPutTextFormSchool(
                        icon: Icons.link,
                        hintText: '',
                        textEditingController: controller.urlController),
                    const SizedBox(
                      height: 5,
                    ),
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
                        textEditingController:
                            controller.descriptionController),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ));
    }));
  }
}
