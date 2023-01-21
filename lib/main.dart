import 'package:flutter/material.dart';
import './hexagon_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/rotate_bloc.dart';

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
      home: BlocProvider(
        create: (_) => RotateBloc(),
        child: const HexagonScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
