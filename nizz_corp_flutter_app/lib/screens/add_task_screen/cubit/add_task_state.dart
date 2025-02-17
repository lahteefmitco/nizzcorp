part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState.initial() = _Initial;
  const factory AddTaskState.listenrStates({
    @Default(null) String? errorMessage,
    @Default(false) bool alertDialog,
    @Default(null) String? navigate,
  }) = _ListenrStates;
  const factory AddTaskState.buildStates({
    @Default(false) bool showProgressbar,
    @Default(null) String? errorMessage,
  }) = _BuildStates;
}
