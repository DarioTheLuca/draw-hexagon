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
      vsync: this,
    )..forward();
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
      body: BlocBuilder<RotateBloc, StateOfHexagon>(
        builder: (context, count) {
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
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<RotateBloc>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<RotateBloc>().decrement(),
          ),
        ],
      ),
    );
  }
}
