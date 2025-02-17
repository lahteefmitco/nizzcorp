import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:niz_corp/repositories/api_repository/api_repository.dart';
import 'package:niz_corp/repositories/firebase_repository/firebase_repository.dart';

part 'add_task_state.dart';
part 'add_task_cubit.freezed.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final FirebaseRepository firebaseRepository;
  final ApiRepository apiRepository;
  AddTaskCubit({
    required this.firebaseRepository,
    required this.apiRepository,
  }) : super(AddTaskState.initial());

/// Add Task to firebase
  void addTaskToFirebase(Map<String, dynamic> task) async {
    try {
      emit(AddTaskState.buildStates(showProgressbar: true));
      final result = await firebaseRepository.addATaskDocument(task: task);

      if (result) {
        await apiRepository.sendFcmToken(task);
        emit(AddTaskState.buildStates(showProgressbar: false));
        emit(AddTaskState.listenrStates(alertDialog: true));
      } else {
        throw Exception("UnExpected error");
      }
    } catch (e) {
      emit(AddTaskState.buildStates(
        showProgressbar: false,
        errorMessage: e.toString(),
      ));
      emit(AddTaskState.listenrStates(errorMessage: e.toString()));
    }
  }

 // Navigate back
  void navigateBack() {
    emit(AddTaskState.listenrStates(navigate: "Navigate"));
  }
  
}
