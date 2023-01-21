import 'dart:math';

import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  HexagonPainter({required this.radius});

  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = const Color.fromARGB(255, 4, 23, 32).withOpacity(0.5)
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final angleMul = [1, 3, 5, 7, 9, 11, 1];
    for (int j = 1; j < 6; j++) {
      for (int i = 0; i < angleMul.length - 1; i++) {
        canvas.drawLine(
          Offset(
            (j / 5) * radius * cos(pi * 2 * (angleMul[i] * 30 / 360)) +
                center.dx,
            (j / 5) * radius * sin(pi * 2 * (angleMul[i] * 30 / 360)) +
                center.dy,
          ),
          Offset(
            (j / 5) * radius * cos(pi * 2 * (angleMul[i + 1] * 30 / 360)) +
                center.dx,
            (j / 5) * radius * sin(pi * 2 * (angleMul[i + 1] * 30 / 360)) +
                center.dy,
          ),
          borderPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
