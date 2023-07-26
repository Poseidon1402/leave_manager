part of 'pause_bloc.dart';

class PauseState {
  final LoadStatus status;
  final List<PauseEntity>? pauses;

  const PauseState({
    required this.status,
    this.pauses,
  });

  factory PauseState.initial() => const PauseState(status: LoadStatus.initial);

  factory PauseState.loading() => const PauseState(status: LoadStatus.loading);

  factory PauseState.success(List<PauseEntity> pauses) => PauseState(
    status: LoadStatus.success,
    pauses: pauses,
  );

  factory PauseState.error() => const PauseState(status: LoadStatus.error);

  factory PauseState.networkError() => const PauseState(status: LoadStatus.networkError);
}