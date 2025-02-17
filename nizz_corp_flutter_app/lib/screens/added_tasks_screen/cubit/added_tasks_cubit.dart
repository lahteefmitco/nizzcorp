import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:niz_corp/repositories/firebase_repository/firebase_repository.dart';
import 'package:niz_corp/util/log_functions.dart';

part 'added_tasks_state.dart';
part 'added_tasks_cubit.freezed.dart';

class AddedTasksCubit extends Cubit<AddedTasksState> {
  final FirebaseRepository firebaseRepository;
  AddedTasksCubit({required this.firebaseRepository})
      : super(AddedTasksState.initial()) {
    getAllAddedTasks();
  }

  /// Get All added tasks to firebase only
  void getAllAddedTasks() async {
    String functionName = StackTrace.current.toString().split("\n")[0];
    try {
      emit(AddedTasksState.buildStates(showProgressBar: true));
      final List<QueryDocumentSnapshot> result =
          await firebaseRepository.getAllAddedTaskDocuments();

      emit(AddedTasksState.buildStates(showProgressBar: false, data: result));
    } catch (e) {
      errorLog(functionName: functionName, error: e.toString());
      emit(AddedTasksState.buildStates(showProgressBar: false));
      emit(AddedTasksState.listenerStates(errorMessage: e.toString()));
    }
  }
}
