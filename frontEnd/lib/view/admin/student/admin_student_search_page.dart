import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../component/container/custom_container.dart';
import '../../../../component/text/big_text.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/colors.dart';
import '../../../logic/Controllers/admin/admin_student_controller.dart';
import '../../../service/model/admin/admin_student_search_model.dart';

class AdminStudentSearchPage extends SearchDelegate {
  design(BuildContext context, Students data) {
    return InkWell(
        onTap: () {
          Get.find<AdminStudentController>()
              .viewStudent(data.id!)
              .then((value) => Get.toNamed(AppRoutes.adminteacherprofilepage));
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          color: Colors.amber.withOpacity(0.00001),
          child: CustomContainer(
            border: 0,
            height: 80,
            radius: 8,
            alignment: Alignment.topLeft,
            backgroundColor:
                Get.isDarkMode ? AppColors.mainColor : AppColors.white,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
                  child: BigText(
                    textAlign: TextAlign.center,
                    textBody: 'Name: ${data.firstName!} ${data.lastName!}',
                    maxLine: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0, top: 8, right:8),
                      child: BigText(
                        textAlign: TextAlign.center,
                        textBody:'Email: ${data.email!}',
                        maxLine: 2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 4.0, top: 8, right: 4),
                      child: BigText(
                        textAlign: TextAlign.center,
                        textBody: 'id:${data.id!}',
                        maxLine: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Students>>(
        future:
            Get.find<AdminStudentController>().getStudentSearch(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Students>? data = snapshot.data;
          return AnimationLimiter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: -300,
                      verticalOffset: -850,
                      child: design(context, data[index])),
                );
              },
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: SizedBox(width: 200, child: Image.asset('images/empty box.png')),
    );
  }
}
