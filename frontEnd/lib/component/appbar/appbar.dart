import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utils/colors.dart';

AppBar appBar(
  BuildContext context,
  IconData? icon,
  String tooltip,
  Function? fun,
  String? title,
  IconData? icon2,
  Function? fun2,
{bool? isBack}
) {
 bool isDark= Theme.of(context).brightness == Brightness.dark;
  return AppBar(
    backgroundColor:isDark? AppColors.mainColor:AppColors.white,
    automaticallyImplyLeading: true,
    actions: <Widget>[
      SizedBox(
        width: 1.w,
      ),
      icon != Icons.adb
          ? IconButton(
              icon: Icon(
                icon,
                color: isDark?AppColors.iconColor:AppColors.mainColor,
                size: 28,
              ),
              tooltip: tooltip,
              onPressed: () async {
                await fun!();
              },
            )
          : const SizedBox(),
      icon2 != Icons.adb
          ? Row(
              children: [
                IconButton(
                  icon: Icon(
                    icon2,
                    color: isDark?AppColors.iconColor:AppColors.mainColor,
                    size: 28,
                  ),
                  tooltip: tooltip,
                  onPressed: () async {
                    await fun2!();
                  },
                ),
              ],
            )
          : const SizedBox()
    ],
    title: Title(
      color: AppColors.white,
      child: Center(
        child: Text(
          title!.isEmpty ? '' : title,
          style: isDark
              ? const TextStyle(color: AppColors.textColor,fontSize: 22)
              : const TextStyle(color: AppColors.mainColor,fontSize: 22),
        ),
      ),
    ),
    elevation: 1,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleSpacing: 00.0,
    centerTitle: true,
    toolbarHeight: 50.0,
    toolbarOpacity: 0.8,
   leading:isBack.isNull? Container():IconButton(onPressed: ()=>Get.back(), icon:  Icon(Icons.arrow_back,
   color:isDark ? AppColors.iconColor:AppColors.mainColor ,)),
  );
}
