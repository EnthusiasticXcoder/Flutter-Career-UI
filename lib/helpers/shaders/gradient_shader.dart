import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint pathPaint = Paint();
    pathPaint.shader = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.lightBlue.shade400,
        Colors.lightBlue.shade300,
        Colors.lightBlue.shade200,
        Colors.lightBlue.shade100,
        Colors.lightBlue.shade100,
        Colors.lightBlue.shade50,
        Colors.lightBlue.shade50,
        Colors.blue.shade50,
        Colors.blue.shade50,
        Colors.white,
      ].reversed.toList(),
    ).createShader(Rect.fromPoints(
        const Offset(0, 0), Offset(size.width, size.height * 0.9)));
    pathPaint.color = Colors.lightBlueAccent;
    Path path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width * 0.5, -size.width),
        radius: size.width * 10));
    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
