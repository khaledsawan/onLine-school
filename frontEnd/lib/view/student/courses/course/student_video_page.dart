import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:pod_player/pod_player.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/small_text.dart';
import 'package:get/get.dart';
import 'package:school/routes/routes.dart';
import '../../../../component/loop/loop_2.dart';
import '../../../../component/text/descriptiontextwidget.dart';
import '../../../../logic/Controllers/student/student_video_controller.dart';
import '../../../../utils/AppConstants.dart';
import '../../../../utils/colors.dart';

class StudentVideoPage extends StatefulWidget {
  const StudentVideoPage({Key? key}) : super(key: key);

  @override
  State<StudentVideoPage> createState() => _StudentVideoPageState();
}

class _StudentVideoPageState extends State<StudentVideoPage> {
  late final PodPlayerController controller;
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Future<void> dispose() async {
    controller.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentVideoController>(builder: (videoController) {
      if (!videoController.isLoaded) {
        controller = PodPlayerController(
          playVideoFrom:
              PlayVideoFrom.youtube(videoController.videoViewModel.item!.url!),
          podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            isLooping: false,
          ),
        )..initialise().then(
            (value) => controller.videoSeekTo(const Duration(seconds: 0)));
        return Scaffold(
          backgroundColor:
              Get.isDarkMode ? AppColors.mainColor : AppColors.white,
          appBar: appBar(context, Icons.adb, '', () {}, '', Icons.adb, () {},
              isBack: true),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PodVideoPlayer(
                      controller: controller,
                      videoThumbnail: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              '${AppConstants.BASE_URL}${videoController.videoViewModel.item!.img!}')),
                      onVideoError: () => IconButton(
                          onPressed: () => Get.toNamed(AppRoutes.contactus),
                          icon: const Icon(Icons.error_outline))),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SmallText(
                          size: 15,
                          textBody:
                              '${videoController.videoViewModel.item!.updatedAt!.substring(0, 10)}  ${videoController.videoViewModel.item!.updatedAt!.substring(11, 16)}',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: BigText(
                        size: 22,
                        maxLine: 3,
                        textAlign: TextAlign.center,
                        textBody: videoController.videoViewModel.item!.name!),
                  ),
                  Divider(),
                  DescriptionTextWidget(
                      text: videoController.videoViewModel.item!.descirption!),
                ],
              ),
            ),
          ),
        );
      } else {
        return const Loop2();
      }
    });
  }
}
