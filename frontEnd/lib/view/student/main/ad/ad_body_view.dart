import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/edgeInsets/padding.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/logic/Controllers/student/student_ad_controller.dart';
import 'package:school/utils/colors.dart';
import '../../../../component/edgeInsets/margin.dart';
import '../../../../component/loop/loop_2.dart';

class AdBodyView extends StatelessWidget {
  const AdBodyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GetBuilder<StudentAdController>(builder: (controller){
          return controller.isLoad?Loop2(): SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: padding(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(controller.adViewModel.item!.img!)),
                ),
                const SizedBox(
                  height: 20,
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
                        textAlign: TextAlign.start,
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                        maxLine: 100,
                        textBody:
                        controller.adViewModel.item!.description!),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(height: 2,color: AppColors.border,),
                const SizedBox(height: 3,),
                Container(height: 2,color: AppColors.border,),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
