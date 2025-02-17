part of 'added_tasks_cubit.dart';

@freezed
class AddedTasksState with _$AddedTasksState {
  const factory AddedTasksState.initial() = _Initial;

  const factory AddedTasksState.listenerStates({
    @Default(null) String? errorMessage,

  }) = _ListenerStates;

  const factory AddedTasksState.buildStates({
    @Default(null) List<QueryDocumentSnapshot>? data,
    @Default(null) String? errorMessage,
    @Default(false) bool showProgressBar,
  }) = _BuildStates;
}
