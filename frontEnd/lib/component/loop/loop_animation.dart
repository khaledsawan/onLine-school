import 'package:flutter/material.dart';
import 'dart:math';

import '../../utils/colors.dart';

class LoopAnimation extends StatefulWidget {
  const LoopAnimation({Key? key}) : super(key: key);

  @override
  _LoopAnimation createState() => _LoopAnimation();
}

class _LoopAnimation extends State<LoopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: MyCustomPainter(_animation.value),
          child: Container(),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double animationValue;

  MyCustomPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 3; value >= 0; value--) {
      circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
          value + animationValue);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color = AppColors.mainColor.withOpacity((1 - (value / 4)).clamp(.0, 1));

    canvas.drawCircle(rect.center,
        sqrt((rect.width * 0.1 * rect.width * 0.1) * value / 4), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return true;
  }
}
