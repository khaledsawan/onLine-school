import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:school/component/container/custom_container.dart';
import 'package:school/component/text/small_text.dart';
import 'package:school/utils/colors.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 200, child: Image.asset('images/no internet.png')),
              const SizedBox(
                height: 30,
              ),
              SmallText(
                textBody: 'You Are OffLine',
                size: 24,
                color: AppColors.blue,
              ),
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {

                 //[Please try this]
                 await Get.deleteAll(force: true);
                 ///You can use normal context here within widget.
                 ///
                   Get.reset();
                 await Restart.restartApp();

                  //  await Restart.restartApp();


                },
                child: CustomContainer(
                  border: 1,
                  radius: 8,
                  width: 120,
                  height: 40,
                  borderColor: AppColors.white,
                  widget:const Text('Restart App'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
