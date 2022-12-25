import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Loop2 extends StatefulWidget {
  const Loop2({super.key});

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<Loop2>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              decoration: ShapeDecoration(
                color: Colors.blue.withOpacity(0.5),
                shape: const CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  6.0 * animationController.value,
                ),
                child: child,
              ),
            );
          },
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.blue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {
              },
              color: Colors.white,
              icon: const Icon(
                Icons.access_time,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}