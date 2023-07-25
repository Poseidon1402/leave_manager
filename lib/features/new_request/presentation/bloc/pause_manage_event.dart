part of 'pause_manage_bloc.dart';

abstract class PauseManageEvent {}

class PauseInsertionEvent extends PauseManageEvent {
  final PauseEntity pause;

  PauseInsertionEvent({required this.pause});
}