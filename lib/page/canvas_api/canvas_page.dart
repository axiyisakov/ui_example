import 'dart:math';

import 'package:flutter/material.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canvas '),
      ),
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ),
      )),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myPaint = Paint();
    myPaint.strokeWidth = 2;
    myPaint.style = PaintingStyle.fill;
    myPaint.color = Colors.orange;

    Paint myOtherPaint1 = Paint();
    myOtherPaint1.strokeWidth = 5;
    myOtherPaint1.style = PaintingStyle.stroke;
    myOtherPaint1.color = Colors.black;

    canvas.drawCircle(const Offset(100, 100), 80, myPaint);
    canvas.drawCircle(const Offset(70, 80), 10, myOtherPaint1);
    canvas.drawCircle(const Offset(130, 80), 10, myOtherPaint1);

    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2 + 40),
          height: 30,
          width: 30,
        ),
        pi,
        -pi,
        false,
        myOtherPaint1);
    canvas.drawLine(
        const Offset(100, 90), const Offset(100, 120), myOtherPaint1);
    canvas.drawLine(
        const Offset(90, 120), const Offset(110, 120), myOtherPaint1);

    // Paint myOtherPaint = Paint();
    // myOtherPaint.strokeWidth = 10;
    // myOtherPaint.style = PaintingStyle.stroke;
    // myOtherPaint.color = Colors.red;
    // canvas.drawLine(const Offset(0, 0), const Offset(200, 0), myOtherPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
