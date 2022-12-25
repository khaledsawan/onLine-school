import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/service/model/student/student_list_view_model.dart';
import '../../../component/appbar/appbar.dart';
import '../../../component/loop/loop_2.dart';
import '../../../component/text/big_text.dart';
import '../../../component/text/small_text.dart';
import '../../../logic/Controllers/student/student_listview_controller.dart';
import '../../../logic/Controllers/student/student_video_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors.dart';

class StudentPlayListViewPage extends StatefulWidget {
  const StudentPlayListViewPage({Key? key}) : super(key: key);

  @override
  State<StudentPlayListViewPage> createState() =>
      _StudentPlayListViewPageState();
}

class _StudentPlayListViewPageState extends State<StudentPlayListViewPage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
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
    return GetBuilder<StudentListViewController>(builder: (controller) {
      return controller.isLoad
          ? const Loop2()
          : Scaffold(
        backgroundColor: Get.isDarkMode?AppColors.mainColor:AppColors.white,
              appBar: appBar(
                  context, Icons.playlist_remove, 'delete listView'.tr, () {
                controller.deleteListFunction(
                    controller.studentListViewModel.playList!.id!);
              }, '', Icons.adb, () {}, isBack: true),
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
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8.0),
                              child: BigText(
                                textBody: controller
                                    .studentListViewModel.playList!.name!,
                                size: 26,
                              ),
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: SmallText(
                                    textBody:
                                        'Video ${controller.studentListViewModel.videoPlayList!.length}',
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .studentListViewModel.videoPlayList!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.studentvideopage);
                                      Get.find<StudentVideoController>()
                                          .viewVideo(
                                              id: controller
                                                  .studentListViewModel
                                                  .videoPlayList![index]
                                                  .videoId!);
                                    },
                                    child: design(
                                        context,
                                        isDark,
                                        width,
                                        height,
                                        controller.studentListViewModel
                                            .videoPlayList![index]));
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
  }
}
//

//
Widget design(
    context, isDark, double width, double height, VideoplayList videoplayList) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 4),
          width: width * 0.6,
          height: 100,
          child: Text(
            videoplayList.videoName!,
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
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        '${AppConstants.BASE_URL}${videoplayList.videoImage!}'))),
            child: const Icon(
              Icons.playlist_play,
              size: 40,
            ),
          ),
        ),
      ],
    ),
  );
}
////
