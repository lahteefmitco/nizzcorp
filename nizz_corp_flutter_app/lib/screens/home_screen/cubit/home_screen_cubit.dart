import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:niz_corp/models/task_document/task_document.dart';
import 'package:niz_corp/repositories/api_repository/api_repository.dart';
import 'package:niz_corp/util/log_functions.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final ApiRepository apiRepository;
  HomeScreenCubit({
    required this.apiRepository,
  }) : super(HomeScreenState.initial()) {
    getInitialTasks();
  }

  void getInitialTasks() async {
    String functionName = StackTrace.current.toString().split("\n")[0];
    try {
      emit(HomeScreenState.buildStates(showProgresBar: true));
      final response = await apiRepository.getInitialTasks();
      emit(HomeScreenState.buildStates(showProgresBar: false,taskDocuments: response));
    } catch (e) {
      emit(HomeScreenState.buildStates(showProgresBar: false,errorMessage: e.toString()));
      emit(HomeScreenState.listnereStates(errorMessage: e.toString()));
      errorLog(functionName: functionName, error: e.toString());
    }
  }

  

 
}
