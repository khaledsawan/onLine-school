import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({super.key, required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: secondHalf.isEmpty
            ? Text(firstHalf,    textAlign: TextAlign.start,)
            : SingleChildScrollView(
          scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Text(
                      flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            flag ? "show more" : "show less",
                            style: const TextStyle(color: AppColors.blue),
                          ),
                          Icon(
                            flag ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
