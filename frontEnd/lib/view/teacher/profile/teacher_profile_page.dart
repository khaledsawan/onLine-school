import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/edgeInsets/padding.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/descriptiontextwidget.dart';
import '../../../component/container/custom_container.dart';
import '../../../component/dialog/send_email_dialog.dart';
import '../../../component/loop/loop_2.dart';
import '../../../component/text/custom_text_in_container.dart';
import '../../../logic/Controllers/teacher/teacher_profile_controller.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors.dart';

class TeacherProfilePage extends StatelessWidget {
  const TeacherProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:isDark?AppColors.mainColor:AppColors.white ,
      appBar: appBar(context, Icons.support_agent, 'support'.tr, () {
    sendEmailDialog(
        'Attention!'.tr,
        AppColors.mainColor,
        '',
        const Text('we send an Email to your Email account please check it.',textAlign: TextAlign.center,style: TextStyle(color:AppColors.white ),));
      }, '', Icons.adb, () {},isBack: true),
      
      body: SafeArea(
        child: GetBuilder<TeacherProfileController>(builder: (controller) {
        return controller.isLoaded
          ? const Loop2()
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: width * 0.353,
                      backgroundColor: AppColors.hintColor,
                      child: CircleAvatar(
                        radius: width * 0.35,
                        backgroundImage:  NetworkImage(AppConstants.BASE_URL+controller.teacherModel.teacher!.img!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: padding(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CustomTextInContainer(
                          text: controller.teacherModel.user!.firstName!,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          textSize: 18,
                          icon: Icons.person,
                        )),
                        Expanded(
                            child: CustomTextInContainer(
                          text: controller.teacherModel.user!.lastName!,
                          textSize: 18,
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          icon: Icons.family_restroom_outlined,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextInContainer(
                      width: width,
                      text: controller.teacherModel.user!.email!,
                      textSize: 18,
                      textAlign: TextAlign.center,
                      alignment: Alignment.center,
                      icon: Icons.email,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextInContainer(
                      width: width,
                      text:
                          controller.teacherModel.teacher!.phone!.toString(),
                      textSize: 18,
                      textAlign: TextAlign.center,
                      alignment: Alignment.center,
                      icon: Icons.phone,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: CustomContainer(
                      alignment: Alignment.topCenter,
                      backgroundColor:
                          isDark ? AppColors.mainColor : AppColors.white,
                      radius: 8,
                      width: width,
                      height: 230,
                      widget: Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.description_outlined),
                              BigText(
                                textBody: 'Dio'.tr,
                                size: 22,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 1,
                            width: width,
                            color: AppColors.hintColor,
                          ),
                          DescriptionTextWidget(
                              text: controller.teacherModel.teacher!.dio!),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
        }),
      ),
    );
  }
}
