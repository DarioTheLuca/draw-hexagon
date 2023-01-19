import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hexagon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HexagonScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HexagonScreen extends StatelessWidget {
  const HexagonScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 23, 87, 197),
      ),
      body: Hexagon(
        screenWidth: screenWidth,
      ),
    );
  }
}

class Hexagon extends StatelessWidget {
  const Hexagon({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;
  double get diameter => screenWidth - 100;
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

    final center = Offset(size.width / 2, size.width / 2);
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
