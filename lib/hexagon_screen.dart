import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './hexagon.dart';
import 'bloc/rotate_bloc.dart';

class HexagonScreen extends StatefulWidget {
  const HexagonScreen({super.key});

  @override
  State<HexagonScreen> createState() => _HexagonScreenState();
}

class _HexagonScreenState extends State<HexagonScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
      vsync: this,
    );
  }

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 23, 87, 197),
      ),
      body: BlocConsumer<RotateBloc, StateOfHexagon>(
        listener: (context, hexagonState) {
          if (hexagonState == StateOfHexagon.rotatingRight) {
            _controller.repeat(reverse: false);
          }
          if (hexagonState == StateOfHexagon.rotatingLeft) {
            _controller.reverse();
          }
          if (hexagonState == StateOfHexagon.idle) {
            _controller.stop();
          }
        },
        builder: (context, hexagonState) {
          return Center(
            child: RotationTransition(
              turns: _animation,
              child: Hexagon(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              child: const Text("Rotate"),
              onPressed: () =>
                  context.read<RotateBloc>().add(RotateRightPressed()),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              child: const Text("Stop"),
              onPressed: () =>
                  context.read<RotateBloc>().add(RotateStopPressed()),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              child: const Text(
                "Reverse",
                textAlign: TextAlign.center,
              ),
              onPressed: () =>
                  context.read<RotateBloc>().add(RotateLeftPressed()),
            ),
          ),
        ],
      ),
    );
  }
}
