import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/small_text.dart';
import 'package:get/get.dart';
import 'package:school/routes/routes.dart';
import '../../../../component/text/descriptiontextwidget.dart';
import '../../../component/loop/loop_animation.dart';
import '../../../logic/Controllers/teacher/teacher_video_controller.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors.dart';

class TeacherVideoPage extends StatefulWidget {
  const TeacherVideoPage({Key? key}) : super(key: key);

  @override
  State<TeacherVideoPage> createState() => _TeacherVideoPageState();
}

class _TeacherVideoPageState extends State<TeacherVideoPage> {
  late final PodPlayerController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<TeacherVideoController>(builder: (videoController) {
    if( !videoController.isLoaded){
      controller = PodPlayerController(
        playVideoFrom:
        PlayVideoFrom.youtube(videoController.videoViewModel.item!.url!),
        podPlayerConfig: const PodPlayerConfig(
          autoPlay: true,
          isLooping: false,
        ),
      )..initialise().then(
              (value) => controller.videoSeekTo(const Duration(seconds: 0)));
      return videoController.isLoaded
          ? const LoopAnimation()
          : Scaffold(
        backgroundColor:
        Get.isDarkMode ? AppColors.mainColor : AppColors.white,
        appBar: appBar(context, Icons.edit, '', () {
          Get.toNamed(AppRoutes.teacherupdatevideopage);
        }, '', Icons.adb, () {}, isBack: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                PodVideoPlayer(
                    controller: controller,
                    videoThumbnail: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            '${AppConstants.BASE_URL}/storage${videoController.videoViewModel.item!.img!}')),
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
                      textBody:
                      videoController.videoViewModel.item!.name!),
                ),
                isDark
                    ? Image.asset('images/line.png')
                    : Image.asset('images/line2.png'),
                DescriptionTextWidget(
                    text: videoController
                        .videoViewModel.item!.descirption!),
              ],
            ),
          ),
        ),
      );
    }else{
      return const Loop2();
    }
    });
  }
}
