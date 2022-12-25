import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/routes/routes.dart';
import '../../component/container/custom_container.dart';
import '../../component/dialog/choose_language.dart';
import '../../component/flutter_switch/night_mode_switch.dart';
import '../../component/flutter_switch/notification_switch.dart';
import '../../component/image/back_ground_image.dart';
import '../../component/text/big_text.dart';
import '../../init/init.dart';
import '../../logic/Controllers/setting/setting_controller.dart';
import '../../utils/colors.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(context, Icons.support_agent_outlined, 'support'.tr,
            () {}, '', Icons.adb, () {}),
        body: GetBuilder<SettingController>(builder: (controller) {
          return SafeArea(
            child: BackGroundImage(
              image: 'images/setting.png',
              widget: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: width,
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.mode_night_sharp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                fontWeight: FontWeight.w500,
                                textBody: 'Night mode'.tr,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              nightModeSwitch(controller),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                   controller.authRepo.roleIs()=='admin'? Container():Container(
                      width: width,
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.notifiOn
                              ? const Icon(Icons.notifications_active)
                              : const Icon(Icons.notifications_off),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                fontWeight: FontWeight.w500,
                                textBody: 'Notification'.tr,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              notificationSwitch(controller),
                            ],
                          )
                        ],
                      ),
                    ),
                    controller.authRepo.roleIs()=='admin'? Container(): const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                      width: width,
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.language),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                fontWeight: FontWeight.w500,
                                textBody: 'Language'.tr,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  changeLanguageAlertDialog(width, context);
                                  // Get.to();
                                },
                                child: CustomContainer(
                                  width: 75,
                                  height: 35,
                                  backgroundColor: isDark
                                      ? AppColors.mainColor.withOpacity(0.3)
                                      : AppColors.white.withOpacity(0.3),
                                  border: 2,
                                  borderColor: AppColors.border,
                                  radius: 12,
                                  alignment: Alignment.center,
                                  widget: BigText(
                                      textBody: Get.locale.toString()),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    controller.authRepo.roleIs()=='admin'? Container():   Container(
                      width: width,
                      margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.person),
                          GestureDetector(
                            onTap: (){
                             controller.authRepo.roleIs()=='student'? Get.toNamed(AppRoutes.studentprofilepage):Get.toNamed(AppRoutes.teacherprofilepage);
                            },
                            child: Container(
                              color: Colors.cyan.withOpacity(0.001),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    fontWeight: FontWeight.w500,
                                    textBody: 'Profile'.tr,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    controller.authRepo.roleIs()=='admin'? Container():  const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                      width: width,
                      margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.groups),
                          GestureDetector(
                            onTap: ()=>  Get.toNamed(AppRoutes.contactus),
                            child: Container(
                              color: Colors.cyan.withOpacity(0.0001),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    fontWeight: FontWeight.w500,
                                    textBody: 'About us'.tr,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.authRepo.clearUserAuth();
                        await init();
                        //Get.reset();
                        Get.offAllNamed(AppRoutes.splashscreen);

                      },
                      child: Container(
                        //     backgroundColor: isDark?AppColors.border:AppColors.white,
                        alignment: Alignment.center,
                        width:180,
                        height: 50,
                        decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.mainColor.withOpacity(0.3)
                                : AppColors.white.withOpacity(0.3),
                            border:
                                Border.all(width: 2, color: AppColors.border),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout,
                              color: AppColors.red,
                              size: 28,
                            ),
                            BigText(
                              textBody: 'Logout'.tr,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
              ),
            ),
          );
        }));
  }
}
