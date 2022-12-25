import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List locale = [
  {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
  {'name': 'Arabic', 'locale': const Locale('ar', 'SY')},
];
updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}

changeLanguageAlertDialog(double width, BuildContext context) {
// set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {},
  );
// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text('Choose Your Language'.tr),
    content: SizedBox(
        width: width * 0.3,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Text(locale[index]['name']),
                  onTap: () {
                    updateLanguage(locale[index]['locale']);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.blue,
              );
            },
            itemCount: locale.length)),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
