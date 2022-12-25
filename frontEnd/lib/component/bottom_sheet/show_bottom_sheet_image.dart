import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utils/colors.dart';
import '../App_Icons/app_icons.dart';
import '../text/big_text.dart';

showBottomSheetImage(context, dynamic controller) {
  double width = MediaQuery.of(context).size.width;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(2.w, 1.h, 1.w, 1.h),
          height:200,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                BigText(
                  textBody: "Please Choose way".tr,
                  size: 23,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4,top: 10,bottom: 10),
                  height: 1,
                  width: width,
                  color: AppColors.hintColor,
                ),
                InkWell(
                  onTap: () async {
                    controller.gallery();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 1.h),
                      child: Row(
                        children: [
                          const AppIcons(
                            icon: Icons.perm_media_outlined,
                            iconColor: AppColors.mainColor,
                            iconSize: 35,
                          ),
                          SizedBox(width: 5.w),
                          BigText(
                            textBody: "From Gallery",
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: () async {
                    controller.camera();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 1.h),
                      child: Row(
                        children: [
                          const AppIcons(
                            icon: Icons.camera,
                            iconColor: AppColors.mainColor,
                            iconSize: 35,
                          ),
                          SizedBox(width: 5.w),
                          BigText(
                            textBody: "From Camera",
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        );
      });
}
