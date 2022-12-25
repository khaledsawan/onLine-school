import 'package:flutter/material.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/logic/Controllers/admin/admin_ad_controller.dart';
import 'package:school/utils/AppConstants.dart';
import 'package:school/utils/colors.dart';
import '../../../../component/edgeInsets/margin.dart';
import 'package:get/get.dart';

import '../../../component/loop/loop_2.dart';

class AdminAdBodyView extends StatelessWidget {
  const AdminAdBodyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminAdController>(builder: (controller){
      return controller.isLoaded? const Loop2():Scaffold(
        appBar: appBar(context, Icons.delete_forever, 'delete', () {
         controller.deleteAd(id: controller.adViewModel.item!.id!);
        }, '', Icons.adb, () {},isBack:true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network('${AppConstants.BASE_URL}${controller.adViewModel.item!.img!}')),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  child: SmallText(textBody: 'createdAt: ${controller.adViewModel.item!.createdAt!}'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  child: SmallText(textBody: 'updatedAt: ${controller.adViewModel.item!.updatedAt!}'),
                ),
                Theme.of(context).brightness == Brightness.dark
                    ? Image.asset('images/line.png')
                    : Image.asset('images/line2.png'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: margin(),
                  child: Center(
                    child: BigText(
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                        maxLine: 100,
                        textBody:
                        controller.adViewModel.item!.description!),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(height: 2,color: AppColors.border,),
                const SizedBox(height: 3,),
                Container(height: 2,color: AppColors.border,),
              ],
            ),
          ),
        ),
      );
    });
  }
}
