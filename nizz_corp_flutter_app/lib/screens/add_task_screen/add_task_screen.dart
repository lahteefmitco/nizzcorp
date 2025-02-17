import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:niz_corp/repositories/api_repository/api_repository.dart';
import 'package:niz_corp/repositories/firebase_repository/firebase_repository.dart';
import 'package:niz_corp/screens/add_task_screen/cubit/add_task_cubit.dart';
import 'package:niz_corp/util/general_function.dart';
import 'package:niz_corp/util/task_type.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  TimeOfDay currentTime = TimeOfDay.now();

  late String currentTimeString;

  DateTime _dateTime = DateTime.now();

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  TaskType? taskType;
  String? date;
  int? parentTaskId;

  bool _showProgressBar = false;

  @override
  void didChangeDependencies() {
    currentTimeString = currentTime.format(context);

    // Retrieve arguments
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    taskType = arguments?["taskType"];
    date = arguments?["date"];
    parentTaskId = arguments?["parentTaskId"];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(
        firebaseRepository: context.read<FirebaseRepository>(),
        apiRepository: context.read<ApiRepository>(),
      ),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listenWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            listenrStates: (a, b, c) => true,
          );
        },
        listener: (context, state) {
          state.mapOrNull(listenrStates: (value) {
            final errorMessage = value.errorMessage;
            if (errorMessage != null) {
              showSnackBar(context: context, message: errorMessage);
            }

            final navigate = value.navigate;
            if (navigate != null) {
              Navigator.pop(context);
            }
            if (value.alertDialog) {
              showDialog(
                  context: context,
                  builder: (cx) => AlertDialog(
                        title: Text("Warning"),
                        content: Text(
                          "You will receive a Notification after 1 minut",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(cx);
                              context.read<AddTaskCubit>().navigateBack();
                            },
                            child: Text("Ok"),
                          )
                        ],
                      ));
            }
          });
        },
        buildWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            buildStates: (a, b) => true,
          );
        },
        builder: (context, state) {
          state.mapOrNull(buildStates: (value) {
            _showProgressBar = value.showProgressbar;
          });
          return Scaffold(
            appBar: AppBar(
              title: Text("Add Task"),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  // Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(currentDate),
                              IconButton(
                                onPressed: () async {
                                  _dateTime = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1971),
                                          lastDate: DateTime(2030)) ??
                                      DateTime.now();
                                  setState(
                                    () {
                                      currentDate = DateFormat("dd-MM-yyyy")
                                          .format(_dateTime);
                                    },
                                  );
                                },
                                icon: Icon(Icons.calendar_month),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(currentTimeString),
                              IconButton(
                                onPressed: () async {
                                  currentTime = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now()) ??
                                      currentTime;
                                  setState(
                                    () {
                                      currentTimeString =
                                          currentTime.format(context);
                                    },
                                  );
                                },
                                icon: Icon(Icons.access_time),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _taskTitleController,
                        decoration: InputDecoration(
                          labelText: "Task Name",
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _taskDescriptionController,
                        decoration: InputDecoration(
                          labelText: "Task Description",
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _showProgressBar
                            ? null
                            : () {
                                final task = {
                                  "title": _taskTitleController.text.trim(),
                                  "description":
                                      _taskDescriptionController.text.trim(),
                                  "time": currentTimeString,
                                  "date": currentDate
                                };
                                context
                                    .read<AddTaskCubit>()
                                    .addTaskToFirebase(task);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 6, 79, 2),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Add Task"),
                      ),
                    ],
                  ),
                  if (_showProgressBar)
                    Center(
                      child: const CircularProgressIndicator(),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
