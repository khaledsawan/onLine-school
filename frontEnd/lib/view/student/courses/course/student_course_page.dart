import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/Custom_snackpar/show_custom_snackpar_green.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/logic/Controllers/notifi/notifi_controller.dart';
import 'package:school/logic/Controllers/student/student_course_controller.dart';
import 'package:school/routes/routes.dart';
import 'package:school/service/model/student/student_course_view_model.dart';
import 'package:school/utils/AppConstants.dart';
import '../../../../component/Custom_snackpar/show_custom_snackpar_notifi.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/bottom_sheet/show_bottom_sheet_playList.dart';
import '../../../../component/text/big_text.dart';
import '../../../../logic/Controllers/student/student_video_controller.dart';
import '../../../../utils/colors.dart';
import '../search/teacher_search_video.dart';

class StudentCoursePage extends StatefulWidget {
  const StudentCoursePage({Key? key}) : super(key: key);

  @override
  State<StudentCoursePage> createState() => _StudentCoursePageState();
}

class _StudentCoursePageState extends State<StudentCoursePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  Widget design(context, isDark, double width, double height,
      VideosStudent videosStudent) {
    return Container(
      color: Colors.cyan.withOpacity(0.01),
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 4),
            width: width * 0.5,
            height: 120,
            child: Text(
              videosStudent.name!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          '${AppConstants.BASE_URL}${videosStudent.img!}'))),
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    showBottomSheetPlayList(context,videosStudent.id!);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 35,
                    color: AppColors.mainColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= Get.height * 0.4) {
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
    _scrollController.dispose(); // dispose the controller
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
    return GetBuilder<StudentCourseController>(builder: (controller) {
      return controller.isLoaded
          ? const Loop2()
          : GetBuilder<NotifiController>(builder: (builder) {
              return builder.isLoading
                  ? const Loop2()
                  : Scaffold(
                backgroundColor: Get.isDarkMode?AppColors.mainColor:AppColors.white,
                      appBar: appBar(
                          context,
                          Icons.search,
                          'search'.tr,
                          () {
                            showSearch(
                                context: context,
                                delegate: StudentSearchVideo(controller
                                    .courseViewModel.courseStudent!.id!));
                          },
                          '',
                          Icons.adb,
                          () {
                            showCustomSnackParNotifi(
                                'teacher Add new Course to his list',
                                'khaled',
                                '');
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
                                              width: 2,
                                              color: AppColors.hintColor),
                                          borderRadius:
                                              BorderRadius.circular(50)),
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
                                                '${AppConstants.BASE_URL}${controller.courseViewModel.courseStudent!.img!}'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(8.0),
                                      child: BigText(
                                        textBody: controller.courseViewModel
                                            .courseStudent!.name!,
                                        size: 26,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: builder.isSus()
                                              ? IconButton(
                                                  onPressed: () async {
                                                    await builder.susTopic(
                                                      teacherId: controller
                                                          .courseViewModel
                                                          .courseStudent!
                                                          .teacherId!,
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .notifications_active_outlined,
                                                    size: 40,
                                                  ))
                                              : IconButton(
                                                  onPressed: () async {
                                                    await builder.unTopic(
                                                        controller
                                                            .courseViewModel
                                                            .courseStudent!
                                                            .teacherId!);
                                                    showCustomSnackParGreen(
                                                        'you are not subscript'
                                                            .tr,
                                                        '!!');
                                                  },
                                                  icon: const Icon(
                                                    Icons.notifications,
                                                    size: 40,
                                                  )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.getTeacherCoursesList(
                                                controller.courseViewModel
                                                    .courseStudent!.teacherId!);
                                            Get.toNamed(AppRoutes
                                                .studentteachercourses);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                alignment: Alignment.bottomLeft,
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: BigText(
                                                  textBody:
                                                      '${controller.courseViewModel.teacherInfo!.firstName!}'
                                                      ' ${controller.courseViewModel.teacherInfo!.lastName!}',
                                                  size: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  backgroundImage: NetworkImage(
                                                    '${AppConstants.BASE_URL}${controller.courseViewModel.courseStudent!.teacherImage!}', //${AppConstants.BASE_URL}/storage${courses.teacherImage!}
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Divider()
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: SmallText(
                                            textBody:
                                                'End Time: ${controller.courseViewModel.courseStudent!.expected_time_to_finsh!}',
                                            size: 12,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.bottomRight,
                                              child: SmallText(
                                                textBody:
                                                    'Videos: ${controller.courseViewModel.courseStudent!.numberOfVideos!}',
                                                size: 15,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: SmallText(
                                                textBody:
                                                    'view ${controller.courseViewModel.courseStudent!.viewerQuntity!}',
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      // physics: const AlwaysScrollableScrollPhysics(), // new
                                      itemCount: controller.courseViewModel
                                          .videosStudent!.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes.studentvideopage);
                                              Get.find<StudentVideoController>()
                                                  .viewVideo(
                                                      id: controller
                                                          .courseViewModel
                                                          .videosStudent![index]
                                                          .id!);
                                            },
                                            child: design(
                                                context,
                                                isDark,
                                                width,
                                                height,
                                                controller.courseViewModel
                                                    .videosStudent![index]));
                                      }),
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      ),
                    );
            });
    });
  }
}
