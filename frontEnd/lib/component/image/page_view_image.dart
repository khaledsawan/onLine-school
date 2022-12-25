import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/text/big_text.dart';
import 'package:school/service/model/admin/admin_teacher_profile_model.dart';
import '../../utils/AppConstants.dart';
import '../../utils/colors.dart';

pageViewImage(int index, dynamic controller, TeacherCourses teacherCourses) {
  double scaleFactor = 0.8;
  double height2 = Get.height * 0.5;
  Matrix4 matrix = Matrix4.identity();
  if (index == controller.currPageValue.floor()) {
    num currScale = 1 - (controller.currPageValue - index) * (1 - scaleFactor);
    double currTrans = height2 * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1.0, currScale.toDouble(), 1.0)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == controller.currPageValue.floor() + 1) {
    var currScale = scaleFactor +
        (controller.currPageValue - index + 1) * (1 - scaleFactor);
    var currTrans = height2 * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == controller.currPageValue.floor() - 1) {
    var currScale = 1 - (controller.currPageValue - index) * (1 - scaleFactor);
    var currTrans = height2 * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1.0, currScale.toDouble(), 1.0)
      ..setTranslationRaw(0, currTrans, 0);
  } else {
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
      ..setTranslationRaw(0, height2 * (1 - scaleFactor) / 2, 0);
  }

  return Transform(
    transform: matrix,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: Get.height * 0.24,
              width: Get.width,
              margin: const EdgeInsets.only(right: 2, left: 2, bottom: 10,top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: AppColors.border,
                      blurRadius: 1.0,
                    ),
                  ],
                  color: AppColors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      '${AppConstants.BASE_URL}${teacherCourses.img!}',
                    ),
                  )),

            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: BigText(textBody: teacherCourses.name!,size: 16,textAlign: TextAlign.center,
            maxLine: 3,),
          )
        ],
      ),
    ),
  );
}
