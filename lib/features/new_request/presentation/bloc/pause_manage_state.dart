part of 'pause_manage_bloc.dart';

class PauseManageState extends Equatable {
  final LoadStatus status;

  const PauseManageState({
    required this.status,
  });

  factory PauseManageState.initial() => const PauseManageState(status: LoadStatus.initial);

  factory PauseManageState.loading() => const PauseManageState(status: LoadStatus.loading);

  factory PauseManageState.success() => const PauseManageState(
      status: LoadStatus.success,
  );

  factory PauseManageState.error() => const PauseManageState(status: LoadStatus.error);

  factory PauseManageState.networkError() => const PauseManageState(status: LoadStatus.networkError);

  @override
  List<Object?> get props => [status];
}