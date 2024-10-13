import 'dart:math';
import 'package:flutter/material.dart';

class AuroraPainter extends CustomPainter {
  final double animationValue;

  AuroraPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 136, 177, 255),
          Color.fromARGB(255, 91, 251, 255),
          Color.fromARGB(255, 204, 102, 255),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height * 0.6);
    for (int i = 0; i <= 10; i++) {
      double x = i * size.width / 10;
      double y =
          size.height * 0.5 + sin((animationValue * 4 * pi) + i / 2) * 80;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
