import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../data/repository/pause_repository.dart';
import '../../../domain/entity/pause_entity.dart';
import '../../../utils/enum/load_status.dart';

part 'pause_event.dart';
part 'pause_state.dart';

class PauseBloc extends Bloc<PauseFetchingEvent, PauseState> {
  final PauseRepository _repository = PauseRepository();

  PauseBloc(): super(PauseState.initial()) {
    on<PauseFetchingEvent>(_mapRoomFetchingEventToState);
  }

  void _mapRoomFetchingEventToState(
      PauseFetchingEvent event, Emitter<PauseState> emit
      ) async {

    try {
      emit(PauseState.loading());
      final pauses = await _repository.getAllPauses();
      emit(PauseState.success(pauses));
    } on SocketException {
      emit(PauseState.networkError());
    } catch (e) {
      print(e);
      emit(PauseState.error());
    }
  }
}