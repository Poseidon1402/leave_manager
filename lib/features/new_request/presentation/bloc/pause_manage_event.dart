part of 'pause_manage_bloc.dart';

abstract class PauseManageEvent {}

class PauseInsertionEvent extends PauseManageEvent {
  final PauseEntity pause;

  PauseInsertionEvent({required this.pause});
}

class PauseUpdateEvent extends PauseManageEvent {

  final String id;
  final String status;

  PauseUpdateEvent({required this.id, required this.status});
}

class PauseDeleteEvent extends PauseManageEvent {

  final String id;

  PauseDeleteEvent({required this.id});
}

class PauseUpdateDataEvent extends PauseManageEvent {

  final String id;
  final String? reason;
  final String? description;

  PauseUpdateDataEvent({
    required this.id,
    this.reason,
    this.description,
  });
}