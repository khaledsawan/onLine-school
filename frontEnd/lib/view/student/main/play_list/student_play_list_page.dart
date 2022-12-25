import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/logic/Controllers/student/student_listview_controller.dart';
import 'package:school/service/model/student/student_index_playList_model.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/dialog/create_list.dart';
import '../../../../component/size/size.dart';
import '../../../../component/text/big_text.dart';
import '../../../../component/text/small_text.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/colors.dart';

class StudentPlayListPage extends StatelessWidget {
  const StudentPlayListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: GetBuilder<StudentListViewController>(builder: (controller) {
        return controller.isLoad
            ? const Scaffold(
                body: Loop2(),
              )
            : Scaffold(
            backgroundColor: isDark?AppColors.mainColor:AppColors.white,
                appBar: appBar(context, Icons.add, 'add'.tr, () {
                  createList('New playList'.tr, AppColors.mainColor,
                      controller.titleController, () {
                    controller.createListFunction();
                  }, () => Get.back());
                }, '', Icons.adb, () {}),
                body:SafeArea(
                  child: RefreshIndicator(child:controller.studentIndexPlayListModel.playList!.isEmpty
                      ?  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            child:
                            Image.asset('images/empty listview.png')),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SmallText(
                              textBody: 'press Bottom to create'.tr,
                              size: 14,
                            ),
                            const SizedBox(width: 6,),
                            GestureDetector(
                              onTap: () {
                                createList(
                                    'New playList'.tr,
                                    AppColors.mainColor,
                                    controller.titleController, () {
                                  controller.createListFunction();
                                }, () => Get.back());
                              },
                              child:  Text(
                                'List View'.tr,
                                style: const TextStyle(
                                    color: AppColors.blue, fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  )
                      : SizedBox(
                    width: width(context),
                    height: height(context),
                    child: AnimationLimiter(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: controller
                            .studentIndexPlayListModel.playList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              verticalOffset: -250,
                              child: ScaleAnimation(
                                duration:
                                const Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: design(
                                    context,
                                    isDark,
                                    controller.studentIndexPlayListModel
                                        .playList![index],
                                    controller),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ), onRefresh: ()=>controller.getMyPlayList()),
                )
          );
      }),
    );
  }
}

design(BuildContext context, bool isDark, PlayList playList,
    StudentListViewController controller) {
  return GestureDetector(
    onTap: () {
      controller.viewPlayList(playList.id!);
      Get.toNamed(AppRoutes.studentplaylistviewpage);
    },
    child: Container(
      color: isDark?AppColors.courseColor:AppColors.white,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: BigText(textBody: playList.name!,fontWeight: FontWeight.bold,size: 22,),
        leading: Image.asset('images/video playList.png'),
        trailing: IconButton(onPressed: (){
          controller.deleteListFunction(playList.id!);
        }, icon:const Icon(Icons.delete_forever,size: 32,)),
      ),
    ),
  );
}
