import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/repository/pause_repository.dart';
import '../../../../core/domain/entity/pause_entity.dart';
import '../../../../core/utils/enum/load_status.dart';

part 'pause_manage_event.dart';
part 'pause_manage_state.dart';

class PauseManageBloc extends Bloc<PauseManageEvent, PauseManageState> {
  final _rep = PauseRepository();

  PauseManageBloc() : super(PauseManageState.initial()) {
    on<PauseInsertionEvent>(_mapPauseInsertionEventToState);
    on<PauseUpdateEvent>(_mapPauseUpdateEventToState);
    on<PauseDeleteEvent>(_mapPauseDeleteEventToState);
    on<PauseUpdateDataEvent>(_mapPauseUpdateDataEventToState);
  }

  void _mapPauseInsertionEventToState(
      PauseInsertionEvent event, Emitter<PauseManageState> emit) async {
    try {
      emit(PauseManageState.loading());
      await _rep.insert(event.pause);
      emit(PauseManageState.success());
    } catch (e) {
      emit(PauseManageState.error());
    }
  }

  void _mapPauseUpdateEventToState(
    PauseUpdateEvent event, Emitter<PauseManageState> emit
      ) async {
    try {
      emit(PauseManageState.loading());
      await _rep.updateStatus(event.id, event.status);
      emit(PauseManageState.loading());
    } catch (e) {
      emit(PauseManageState.error());
    }
  }

  void _mapPauseDeleteEventToState(
      PauseDeleteEvent event, Emitter<PauseManageState> emit
      ) async {
    try {
      emit(PauseManageState.loading());
      await _rep.deletePause(event.id);
      emit(PauseManageState.loading());
    } catch (e) {
      emit(PauseManageState.error());
    }
  }

  void _mapPauseUpdateDataEventToState(
      PauseUpdateDataEvent event, Emitter<PauseManageState> emit
      ) async {
    try {
      emit(PauseManageState.loading());
      await _rep.update(event.id, event.reason, event.description);
      emit(PauseManageState.loading());
    } catch (e) {
      emit(PauseManageState.error());
    }
  }
}