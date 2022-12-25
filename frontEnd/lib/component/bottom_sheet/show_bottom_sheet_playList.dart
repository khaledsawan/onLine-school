import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:sizer/sizer.dart';
import '../../logic/Controllers/student/student_listview_controller.dart';
import '../../utils/colors.dart';
import '../dialog/create_list.dart';

showBottomSheetPlayList(context,int videoId) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return GetBuilder<StudentListViewController>(builder: (controller) {
          return controller.isLoad
              ? const Center(
                  child: Loop2(),
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(2.w, 1.h, 1.w, 1.h),
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Save Video in..'),
                          GestureDetector(
                            onTap: (){
                              createList('New playList'.tr, AppColors.mainColor,
                                  controller.titleController, () {
                                    controller.createListFunction();
                                  }, () => Get.back());
                            },
                            child: Container(
                              color: AppColors.blue.withOpacity(0.05),
                              child: Row(
                                children: const [
                                  Text(
                                    'create new playlist',
                                    style: TextStyle(
                                        color: AppColors.blue, fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: AppColors.blue,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller
                                .studentIndexPlayListModel.playList!.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(

                                  leading:
                                      Image.asset('images/video playList.png'),
                                  trailing: Checkbox(
                                      value: controller.selectedItems.contains(
                                          controller.studentIndexPlayListModel
                                              .playList![index].id),
                                      onChanged: (b) {
                                        if (!controller.selectedItems.contains(
                                            controller.studentIndexPlayListModel
                                                .playList![index].id)) {
                                          controller.addItem(controller
                                              .studentIndexPlayListModel
                                              .playList![index]
                                              .id);
                                        } else {
                                          controller.removeItem(controller
                                              .studentIndexPlayListModel
                                              .playList![index]
                                              .id);
                                        }
                                      }),
                                  title: Text(controller.studentIndexPlayListModel
                                      .playList![index].name!),
                                ),
                              );
                            }),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () async {
                         await controller.addVideoToListFunction(videoId);
                        },
                        child: Container(
                            height: 35,
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: const Text('Add',
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      )
                    ],
                  ),
                );
        });
      });
}
