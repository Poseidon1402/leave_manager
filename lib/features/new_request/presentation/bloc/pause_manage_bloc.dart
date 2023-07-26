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
  }

  void _mapPauseInsertionEventToState(
      PauseInsertionEvent event, Emitter<PauseManageState> emit) async {
    try {
      await _rep.insert(event.pause);
      emit(PauseManageState.success());
    } catch (e) {
      emit(PauseManageState.error());
    }
  }
}