import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../text/big_text.dart';

showBottomSheetChose(context,Function onDelete,Function onView,Function onUpdate) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(2.w, 1.h, 1.w, 1.h),
          height:  180,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    onView();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 1.h),
                      child: Row(
                        children: [
                        const  Icon(Icons.videocam),
                          SizedBox(width: 5.w),
                          BigText(
                            textBody: "View",
                          )
                        ],
                      )),
                ),
                const  Divider(),
                InkWell(
                  onTap: () async {
                    onUpdate();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 1.h),
                      child: Row(
                        children: [
                          const   Icon(Icons.video_settings_outlined),
                          SizedBox(width: 5.w),
                          BigText(
                            textBody: "Edit",
                          )
                        ],
                      )),
                ),const Divider(),

                InkWell(
                  onTap: () async {
                    onDelete();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 1.h),
                      child: Row(
                        children: [
                          const  Icon(Icons.delete),
                          SizedBox(width: 5.w),
                          BigText(
                            textBody: "Delete",
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
