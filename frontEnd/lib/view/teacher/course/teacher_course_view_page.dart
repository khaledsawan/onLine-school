import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/Custom_snackpar/show_custom_snackPar_red.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/routes/routes.dart';
import 'package:school/view/teacher/serach/teacher_search_video.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/text/big_text.dart';
import '../../../../utils/colors.dart';
import '../../../component/bottom_sheet/show_bottom_sheet_chose.dart';
import '../../../component/dialog/confirm_dialog.dart';
import '../../../logic/Controllers/teacher/teacher_course_controller.dart';
import '../../../logic/Controllers/teacher/teacher_video_controller.dart';
import '../../../utils/AppConstants.dart';

class TeacherStudentCoursePage extends StatefulWidget {
  const TeacherStudentCoursePage({Key? key}) : super(key: key);
  @override
  State<TeacherStudentCoursePage> createState() =>
      _TeacherStudentCoursePageState();
}

class _TeacherStudentCoursePageState extends State<TeacherStudentCoursePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= Get.height * 0.1) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<TeacherCourseController>(builder: (controller) {
      return controller.isLoaded
          ? const Loop2()
          : RefreshIndicator(
              onRefresh: () => controller.viewCourse(
                  id: controller.courseViewModel.course!.id!),
              child: Scaffold(
                backgroundColor:  Get.isDarkMode?AppColors.mainColor:AppColors.white,
                appBar: appBar(
                    context,
                    Icons.search,
                    'search'.tr,
                    () {
                      showSearch(
                          context: context,
                          delegate: TeacherSearchVideo(
                              controller.courseViewModel.course!.id!));
                    },
                    '',
                    Icons.add,
                    () {
                      Get.toNamed(AppRoutes.teacheraddvideopage);
                    },
                    isBack: true),
                floatingActionButton: _showBackToTopButton == false
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(right: width * 0.4),
                        child: IconButton(
                            onPressed: _scrollToTop,
                            icon: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: AppColors.hintColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.arrow_upward,
                                  size: 30,
                                ))),
                      ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width,
                          // height: height*0.4+30,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                height: height * 0.4,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(6),
                                      bottomLeft: Radius.circular(6)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${AppConstants.BASE_URL}${controller.courseViewModel.course!.img!}'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BigText(
                                  textAlign: TextAlign.center,
                                  textBody:
                                      controller.courseViewModel.course!.name!,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 2.0, left: 8),
                                    child: SmallText(
                                      textBody:
                                          'Views:  ${controller.courseViewModel.course!.viewerQuntity}',
                                      size: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 2.0, right: 8),
                                    child: SmallText(

                                      textBody: 'Expected time to finish :'.tr +
                                          controller.courseViewModel.course!
                                              .expected_time_to_finsh!,
                                      textAlign: TextAlign.end,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              isDark
                                  ? Image.asset('images/line.png')
                                  : Image.asset('images/line2.png'),
                            ],
                          ),
                        ),
                        controller.courseViewModel.videos!.isEmpty
                            ? Center(
                                child: Column(
                                children: [
                                  SizedBox(
                                      width: 150,
                                      child: Image.asset('images/empty box.png')),
                                  SmallText(textBody: 'not upload video yet')
                                ],
                              ))
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    controller.courseViewModel.videos!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.teachervideopage);
                                        Get.find<TeacherVideoController>()
                                            .viewVideo(
                                                id: controller.courseViewModel
                                                    .videos![index].id!)
                                            .then((value) {
                                          if (value.isSuccessful!) {

                                          } else {
                                            showCustomSnackBarRed(
                                                'check your internet connection'
                                                    .tr,
                                                'error'.tr);
                                          }
                                        });
                                      },
                                      child: Container(
                                        color: Get.isDarkMode
                                            ? AppColors.mainColor
                                            : AppColors.white,
                                        child: design(
                                            context,
                                            isDark,
                                            width,
                                            height,
                                            controller.courseViewModel
                                                .videos![index].name!,
                                            controller.courseViewModel
                                                .videos![index].img!,
                                            controller.courseViewModel
                                                .videos![index].id!),
                                      ));
                                }),
                        const Divider()
                      ],
                    ),
                  ),
                ),
              ));
    });
  }
}

Widget design(context, isDark, double width, double height, String name,
    String img, int id) {
  return Container(
    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              showBottomSheetChose(
                  context,
                  () {
                    Navigator.pop(context);
                    confirmDialog(
                        'Are you sure!'.tr,
                        AppColors.mainColor,
                        BigText(
                            textBody:
                                'when delete the user all his information well be deleted'
                                    .tr), () {
                      confirmMethod(id);
                    }, () => cancelMethod);
                  },
                  () {},
                  () {
                    Get.toNamed(
                        AppRoutes.teachervideopage);
                    Get.find<TeacherVideoController>()
                        .viewVideo(id: id)
                        .then((value) {
                      if (value.isSuccessful!) {

                      } else {
                        showCustomSnackBarRed(
                            'check your internet connection'.tr, 'error'.tr);
                      }
                    });
                  });
            },
            icon: const Icon(Icons.more_vert)),
        Container(
          padding: const EdgeInsets.only(top: 4),
          width: width * 0.5,
          height: 100,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  
                    fit: BoxFit.fill,
                    image: NetworkImage('${AppConstants.BASE_URL}$img'))),
          ),
        ),
      ],
    ),
  );
}

confirmMethod(int id) {
  Get.find<TeacherVideoController>().deleteVideo(id: id);
}

cancelMethod() {
  Get.back();
}
