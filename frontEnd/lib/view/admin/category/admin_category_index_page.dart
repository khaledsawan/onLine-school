import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/dialog/confirm_dialog.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/custom_text_in_container.dart';
import 'package:school/routes/routes.dart';
import 'package:school/utils/colors.dart';
import 'package:school/view/admin/teacher/admin_teacher_courses_page.dart';
import '../../../component/loop/loop_animation.dart';
import '../../../logic/Controllers/admin/admin_category_controller.dart';

class AdminCategoryIndexPage extends StatelessWidget {
  const AdminCategoryIndexPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(context, Icons.add, 'add Category', () {
              Get.toNamed(AppRoutes.adminaddcategorypage);
            }, 'Index Category', Icons.adb, () {}),
            body: GetBuilder<AdminCategoryController>(builder: (controller) {
              return controller.isLoaded
                  ? const LoopAnimation()
                  : AnimationLimiter(
                      child: GridView.builder(
                          itemCount: controller.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2,
                                  childAspectRatio: 20 / 14,
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 400),
                                columnCount: 2,
                                child: ScaleAnimation(
                                    duration: const Duration(milliseconds: 700),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: GestureDetector(
                                      onLongPress: () {
                                        confirmDialog(
                                            'by confirm the category will deleted!',
                                            AppColors.mainColor,
                                            Container(),
                                            () => deleteMethodCategory(
                                                controller
                                                    .productList[index].id!),
                                            () => null);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.all(4),
                                        width: width * 0.3,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.border)),
                                        alignment: Alignment.center,
                                        child: BigText(
                                          textAlign: TextAlign.center,
                                          maxLine: 2,
                                          textBody: controller
                                              .productList[index].name!,
                                        ),
                                      ),
                                    )));
                          }));
            })));
  }
}

//

//
deleteMethodCategory(int id) {
  Get.find<AdminCategoryController>().deleteCategory(id);
  print('object');
  Get.back();
}
