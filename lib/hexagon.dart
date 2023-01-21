import 'package:flutter/material.dart';
import 'dart:math';
import './hexagon_painter.dart';

class Hexagon extends StatelessWidget {
  const Hexagon({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;
  double get diameter => min(screenWidth, screenHeight) - 100;
  double get radius => diameter / 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: HexagonPainter(radius: radius),
        )
      ],
    );
  }
}
