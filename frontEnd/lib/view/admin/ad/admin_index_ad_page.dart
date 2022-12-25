import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/size/size.dart';
import 'package:school/routes/routes.dart';
import 'package:school/utils/AppConstants.dart';
import '../../../../component/loop/loop_2.dart';
import '../../../../service/model/common model/ad_index_model.dart';
import '../../../logic/Controllers/admin/admin_ad_controller.dart';

class AdminAdsIndexView extends StatelessWidget {
  const AdminAdsIndexView({Key? key}) : super(key: key);
  design(AdBodyModel adBodyModel, AdminAdController controller) {
    return InkWell(
      onTap: () {
        controller.viewAd(id: adBodyModel.id!);
        Get.toNamed(AppRoutes.adminadbodyview);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network('${AppConstants.BASE_URL}${adBodyModel.img!}')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Icons.add_photo_alternate, 'add Ad',
          (){
        Get.toNamed(AppRoutes.adminaddadpage);
          }, '', Icons.adb, (){}),
      body: SafeArea(
          child: GetBuilder<AdminAdController>(builder: (controller) {
            return controller.isLoaded
                ? const Loop2()
                : SizedBox(
              width: width(context),
                  height: height(context)-70,
                  child: AnimationLimiter(
              child: controller.adIndexModel.data!.isEmpty
                    ? Center(child: SizedBox(width:200,child: Image.asset('images/empty box.png')))
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: controller.adIndexModel.data!.length,
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
                              controller.adIndexModel.data![index], controller)),
                    );
                  },
              ),
            ),
                );
          })),
    );
  }
}
