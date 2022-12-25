import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/teacher/teacher_course_controller.dart';
import '../../logic/Controllers/admin/admin_category_controller.dart';
import '../../service/model/common model/category_index_model.dart';
import '../../utils/colors.dart';
import '../image/image_in_container.dart';

class CategoryDropDownWidget extends StatelessWidget {
  dynamic controller;
  CategoryDropDownWidget({Key? key, required this.controller})
      : super(key: key);

  List<Category> categorys = Get.find<AdminCategoryController>().productList;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: DropdownButton<Category>(
      //  value: Get.find<TeacherCourseController>().categorySelected,
        icon: const Icon(Icons.keyboard_arrow_down,color: AppColors.blue,),
        iconSize: 30,
        underline: Container(
          height: 2,
          color: AppColors.innerShadow,
        ),
        itemHeight: 65,
        hint: Ink(
          child: Text(
            controller.categoryMethod.name,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        items: categorys.map((categorys) {
          return DropdownMenuItem<Category>(
            alignment: Alignment.center,
            value: categorys,
            child: Ink(
              child: Text(
                categorys.name!,
                style:  TextStyle(color: Get.isDarkMode?AppColors.textColor:AppColors.black, fontSize: 16),
              ),
            ),
          );
        }).toList(),
        onChanged: (Category? newValue) {
          controller.setMethod(newValue);
        },
      ),
    );
  }
}
