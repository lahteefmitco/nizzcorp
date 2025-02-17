part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.listnereStates({
    @Default(null) String? naivigate,
    @Default(null) String? errorMessage,
  }) = _ListenerStates;

   const factory HomeScreenState.buildStates({
    @Default(false) bool showProgresBar,
    @Default(null)List<TaskDocument>? taskDocuments,
    @Default(null) String? errorMessage,
  }) = _BuildStates;
}
