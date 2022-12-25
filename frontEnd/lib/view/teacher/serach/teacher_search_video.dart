import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../component/container/custom_container.dart';
import '../../../component/image/image_in_container.dart';
import '../../../component/size/size.dart';
import '../../../component/text/big_text.dart';
import '../../../logic/Controllers/teacher/teacher_video_controller.dart';
import '../../../routes/routes.dart';
import '../../../service/model/teacher model/teacher_search_model.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors.dart';

class TeacherSearchVideo extends SearchDelegate {
  late int i;
  TeacherSearchVideo(this.i);

  design(BuildContext context, SearchData data) {
    return InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.teachervideopage);
          Get.find<TeacherVideoController>().viewVideo(id: data.id!);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: CustomContainer(
            border: 0,
            height: 100,
            radius: 8,
            backgroundColor:
                Get.isDarkMode ? AppColors.mainColor : AppColors.white,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: width(context) * 0.60,
                      padding:
                          const EdgeInsets.only(left: 4.0, top: 8, right: 4),
                      child: BigText(
                        textAlign: TextAlign.center,
                        textBody: data.name!,
                        maxLine: 2,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(data.img!),
                      backgroundColor: Colors.transparent,
                    )
                  ],
                ),
                ImageInContainer(
                  image: '${AppConstants.BASE_URL}${data.img!}',
                  height: 100,
                  width: width(context) * 0.34,
                )
              ],
            ),
          ),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<SearchData>>(
        future: Get.find<TeacherVideoController>()
            .getVideoSearch(query: query, id: i),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: SizedBox(
                  width: 200, child: Image.asset('images/empty box.png')),
            );
          }
          List<SearchData>? data = snapshot.data;
          return Container(
            width: width(context),
            height: height(context),
            color: Get.isDarkMode ? AppColors.mainColor : AppColors.white,
            child: AnimationLimiter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        horizontalOffset: -300,
                        verticalOffset: -850,
                        child: design(context, data[index])),
                  );
                },
              ),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Get.isDarkMode ? AppColors.mainColor : AppColors.white,
      child: Text(
        'Search Word'.tr,
        style: GoogleFonts.freehand(
            fontSize: 24,
            color: Get.isDarkMode ? AppColors.textColor : AppColors.mainColor),
      ),
    );
  }
}
