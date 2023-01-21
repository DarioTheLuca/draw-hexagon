import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RotateEvent {}

class RotateRightPressed extends RotateEvent {}

class RotateLeftPressed extends RotateEvent {}

class RotateStopPressed extends RotateEvent {}

enum StateOfHexagon { rotatingLeft, idle, rotatingRight }

class RotateBloc extends Bloc<RotateEvent, StateOfHexagon> {
  RotateBloc() : super(StateOfHexagon.idle) {
    on<RotateRightPressed>((event, emit) => emit(StateOfHexagon.rotatingRight));
    on<RotateStopPressed>((event, emit) => emit(StateOfHexagon.idle));
    on<RotateLeftPressed>((event, emit) => emit(StateOfHexagon.rotatingLeft));
  }
}
