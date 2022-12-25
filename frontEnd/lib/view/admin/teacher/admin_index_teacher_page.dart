import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:school/component/loop/loop_2.dart';
import 'package:school/logic/Controllers/admin/admin_teacher_controller.dart';
import 'package:school/service/model/admin/admin_teacher_index.dart';
import 'package:school/utils/AppConstants.dart';
import '../../../component/dropdown/sort_dropdown_widget.dart';
import '../../../component/text/big_text.dart';
import '../../../component/text/small_text.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors.dart';
import 'admin_teacher_search_page.dart';

class AdminIndexTeacherPage extends StatelessWidget {
  const AdminIndexTeacherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.mainColor,
                splashColor: AppColors.blue,
                child: const Icon(
                  Icons.person_add_alt_1_sharp,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.adminteacheraddpage);
                }),
            body: GetBuilder<AdminTeacherController>(builder: (controller) {
              return controller.isLoad
                  ? const Loop2()
                  : RefreshIndicator(
                      onRefresh: () => controller.getTeacherList(),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showSearch(
                                            context: context,
                                            delegate: AdminTeacherSearchPage());
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
                                            textBody: 'teacher count',
                                            size: 16,
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      BigText(
                                        textBody: controller
                                            .adminTeacherIndex.data!.length
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
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
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
                              onRefresh: () => controller.getTeacherList(),
                              child:  SizedBox(
                                      width: width,
                                      height: height - 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: AnimationLimiter(
                                            child: GridView.builder(
                                                itemCount: controller
                                                    .adminTeacherIndex
                                                    .data!
                                                    .length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        mainAxisSpacing: 12,
                                                        crossAxisSpacing: 10,
                                                        childAspectRatio:
                                                            20 / 28,
                                                        crossAxisCount: 2),
                                                itemBuilder: (context, index) {
                                                  return AnimationConfiguration
                                                      .staggeredGrid(
                                                          position: index,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      400),
                                                          columnCount: 2,
                                                          child: ScaleAnimation(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        700),
                                                            curve: Curves
                                                                .fastLinearToSlowEaseIn,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Get.find<
                                                                        AdminTeacherController>()
                                                                    .viewTeacher(controller
                                                                        .adminTeacherIndex
                                                                        .data![
                                                                            index]
                                                                        .id!);
                                                                Get.toNamed(
                                                                    AppRoutes
                                                                        .adminteacherprofilepage);
                                                              },
                                                              child:
                                                                  FadeInAnimation(
                                                                child: designDark(
                                                                    height,
                                                                    controller
                                                                        .adminTeacherIndex
                                                                        .data![index]),
                                                              ),
                                                            ),
                                                          ));
                                                })),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
            })));
  }
}

designDark(double height, Data data) {
  return Column(
    children: [
      Container(
        height: height * 0.23,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: NetworkImage(
                    '${AppConstants.BASE_URL}${data.img!}'),
                fit: BoxFit.fill)),
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: BigText(textBody: '${data.firstName!} ${data.lastName!}'),
      )
    ],
  );
}
