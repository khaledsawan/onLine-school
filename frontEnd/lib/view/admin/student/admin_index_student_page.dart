import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/routes/routes.dart';
import 'package:school/service/model/admin/admin_student_index_model.dart';
import '../../../component/dropdown/sort_dropdown_widget.dart';
import '../../../component/icon_than_text/icon_than_text.dart';
import '../../../component/text/big_text.dart';
import '../../../component/text/small_text.dart';
import '../../../logic/Controllers/admin/admin_student_controller.dart';
import '../../../utils/colors.dart';
import 'admin_student_search_page.dart';

class AdminIndexStudentPage extends StatelessWidget {
  const AdminIndexStudentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Get.isDarkMode;
    return SafeArea(child: Scaffold(
        body: GetBuilder<AdminStudentController>(builder: (controller) {
      return controller.isLoad
          ? const Loop2()
          : Column(
              children: [
                SizedBox(
                  height: 60,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: AdminStudentSearchPage());
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 50,
                          )),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: SmallText(
                                textBody: 'student count',
                                size: 16,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          BigText(
                            textBody: controller
                                .adminStudentIndexModel.studentIndex!.length
                                .toString(),
                            size: 28,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: SortDropDownWidget(
                              controller: controller,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: 20,
                ),
                RefreshIndicator(
                  onRefresh: () => controller.getStudentList(),
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller
                          .adminStudentIndexModel.studentIndex!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              controller.viewStudent(controller
                                  .adminStudentIndexModel
                                  .studentIndex![index]
                                  .id!);
                              Get.toNamed(AppRoutes.adminshowstudentpage);
                            },
                            child: design(
                                width,
                                isDark,
                                controller.adminStudentIndexModel
                                    .studentIndex![index]));
                      },
                    ),
                  ),
                ),
              ],
            );
    })));
  }
}

design(double width, bool isDark, StudentIndex studentIndex) {
  return Container(
    margin: const EdgeInsets.all(4),
    //width: width,
    // height: 220,
    decoration: BoxDecoration(
      border: Border.all(width: 3, color: AppColors.border),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: IconThanText(
                margin: const EdgeInsets.only(left: 6, top: 6, right: 6),
                sizedWidth: 0,
                width: width,
                icon: Icons.school,
                text: '${studentIndex.firstName!} ${studentIndex.lastName!}',
                iconColor: isDark ? AppColors.iconColor : AppColors.mainColor,
                color: AppColors.white,
                textColor: AppColors.textColor,
              ),
            ),
          ],
        ),
        IconThanText(
          margin: const EdgeInsets.only(left: 6, top: 6, right: 6),
          width: width,
          icon: Icons.email,
          text: studentIndex.email!,
          iconColor: isDark ? AppColors.iconColor : AppColors.mainColor,
          color: AppColors.white,
          textColor: AppColors.textColor,
        ),
        Row(
          children: [
            Expanded(
              child: IconThanText(
                margin: const EdgeInsets.only(left: 6, top: 6, bottom: 6),
                sizedWidth: 0,
                width: width,
                icon: Icons.verified_rounded,
                text: studentIndex.package!,
                iconColor: isDark ? AppColors.iconColor : AppColors.mainColor,
                color: AppColors.white,
                textColor: AppColors.textColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              margin: const EdgeInsets.all(6.0),
              child: SizedBox(
                  height: 20,
                  child: BigText(
                    textBody: 'id: ${studentIndex.id!}',
                    textAlign: TextAlign.center,
                  )),
            ),
            GestureDetector(
              onTap: () {
                print('tip');
              },
              child: Container(
                width: 25,
                height: 45,
                color: Colors.cyan.withOpacity(0.01),
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                child: const Icon(Icons.more_vert),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
