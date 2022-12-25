import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/student/student_ad_controller.dart';
import 'package:school/routes/routes.dart';
import '../../../../component/loop/loop_2.dart';
import '../../../../service/model/common model/ad_index_model.dart';

class StudentAdsIndexView extends StatelessWidget {
  const StudentAdsIndexView({Key? key}) : super(key: key);
  design(AdBodyModel adBodyModel, StudentAdController controller) {
    return InkWell(
      onTap: () {
        controller.viewAd(id: adBodyModel.id!);
        Get.toNamed(AppRoutes.adbodyview);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(adBodyModel.img!)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<StudentAdController>(builder: (controller) {
        return controller.isLoad
            ? const Loop2()
            : AnimationLimiter(
                child: controller.productList.isEmpty
                    ? Center(child: SizedBox(width:200,child: Image.asset('images/empty box.png')))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: controller.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                                duration: const Duration(milliseconds: 2500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                horizontalOffset: -300,
                                verticalOffset: -850,
                                child: design(
                                    controller.productList[index], controller)),
                          );
                        },
                      ),
              );
      })),
    );
  }
}
