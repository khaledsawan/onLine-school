import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import '../../../component/button/custom_button.dart';
import '../../../component/inputtextform/inputtextformschool.dart';
import '../../../component/loop/loop_animation.dart';
import '../../../logic/Controllers/admin/admin_category_controller.dart';

class AdminAddCategoryPage extends StatelessWidget {
  const AdminAddCategoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(context, Icons.category, 'category index', () {
              //   Get.to(page);
            }, 'Update Category', Icons.adb, () {}),
            body: GetBuilder<AdminCategoryController>(builder: (controller) {
              return controller.isLoaded
                  ? const LoopAnimation()
                  : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    InPutTextFormSchool(
                        icon: Icons.video_label,
                        hintText: 'Category Name'.tr,
                        textEditingController: controller.nameController),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                      buttonText: 'Update'.tr,
                      width: 150,
                      height: 60,
                      radius: 16,
                      onPressed: () {
                      //  controller.updateMethod(controller);
                      },
                      fontSize: 23,
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              );
            })));
  }
}
