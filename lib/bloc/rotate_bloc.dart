import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RotateEvent {}

class RotateRightPressed extends RotateEvent {}

class RotateLeftPressed extends RotateEvent {}

class RotateStopPressed extends RotateEvent {}

class RotateResetPressed extends RotateEvent {}

enum StateOfHexagon {
  idle,
  rotatingLeft,
  reset,
  rotatingRight,
}

class RotateBloc extends Bloc<RotateEvent, StateOfHexagon> {
  RotateBloc() : super(StateOfHexagon.idle) {
    on<RotateRightPressed>((event, emit) => emit(StateOfHexagon.rotatingRight));
    on<RotateStopPressed>((event, emit) => emit(StateOfHexagon.idle));
    on<RotateLeftPressed>((event, emit) => emit(StateOfHexagon.rotatingLeft));
    on<RotateResetPressed>((event, emit) => emit(StateOfHexagon.reset));
  }
}
