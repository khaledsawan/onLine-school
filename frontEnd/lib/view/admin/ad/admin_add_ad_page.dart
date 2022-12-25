import 'package:flutter/material.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/edgeInsets/padding.dart';
import 'package:school/component/image/take_image_layout.dart';
import 'package:school/component/inputtextform/input_text_without_border.dart';
import 'package:school/component/loop/loop_animation.dart';
import '../../../../component/edgeInsets/margin.dart';
import 'package:get/get.dart';
import '../../../logic/Controllers/admin/admin_ad_controller.dart';

class AdminAddAdPage extends StatelessWidget {
  const AdminAddAdPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<AdminAdController>(builder: (controller) {
      return !controller.isLoaded
          ? Scaffold(
              appBar: appBar(context, Icons.save, 'save', () {
               controller.saveMethod();
              }, '', Icons.adb, () {}),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: padding(),
                        child: takeImageLayout('press to add image', controller,
                            context, width, height),
                      ),
                      const SizedBox(
                        height: 10,
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
                            child: InPutTextWithOutBorder(
                                maxLine: 15,
                                hintText: 'description',
                                textEditingController:
                                    controller.nameController)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            )
          :const LoopAnimation();
    });
  }
}
