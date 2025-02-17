import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:niz_corp/models/task_document/task_document.dart';
import 'package:niz_corp/repositories/api_repository/api_repository.dart';
import 'package:niz_corp/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:niz_corp/util/general_function.dart';
import 'package:niz_corp/util/routes.dart';
import 'package:niz_corp/util/task_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showProgressBar = false;
  List<TaskDocument>? _taskDocuments;
  String? _apiFetchingErrorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeScreenCubit(apiRepository: context.read<ApiRepository>()),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listenWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            listnereStates: (a, b) => true,
          );
        },
        listener: (context, state) {
          state.mapOrNull(
            listnereStates: (value) {
              final errMessage = value.errorMessage;
              final navigate = value.naivigate;

              if (errMessage != null) {
                showSnackBar(context: context, message: errMessage);
              }

              if (navigate != null) {
                // TODO
              }
            },
          );
        },
        buildWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            buildStates: (a, b, c) => true,
          );
        },
        builder: (context, state) {
          state.mapOrNull(buildStates: (value) {
            _showProgressBar = value.showProgresBar;
            _taskDocuments = value.taskDocuments;
            _apiFetchingErrorMessage = value.errorMessage;
          });

          // Scaffold
          return SafeArea(
            child: Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, added_Tasks);
                  },
                  label: Text("ADDED TASKS"),
                ),

                // App bar
                appBar: AppBar(
                  title: Text("API TASKS"),
                  centerTitle: true,
                ),

                // Body
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (_taskDocuments != null && _taskDocuments!.isEmpty)
                      Center(
                        child: Text(
                          "Empty Tasks",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),

                    // List view
                    if (_taskDocuments != null && _taskDocuments!.isNotEmpty)
                      ListView.separated(
                        itemBuilder: (context, index) {
                          final taskDocumet = _taskDocuments![index];
                          final tasks = taskDocumet.tasks;

                          // Main expansion tile
                          return ExpansionTile(
                            title: Row(
                              children: [
                                Text("Date:- ${taskDocumet.date} "),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    final argument = {
                                      "taskType": TaskType.mainTask,
                                      "date": taskDocumet.date,
                                    };
                                    Navigator.pushNamed(
                                      context,
                                      "/add_task",
                                      arguments: argument,
                                    );
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Color.fromARGB(255, 1, 97, 1),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Add",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            showTrailingIcon: tasks != null,
                            children: tasks == null
                                ? []
                                : List.generate(
                                    tasks.length,
                                    (index) {
                                      final task = tasks[index];
                                      final subTasks = task.subtasks;

                                      // Tasks
                                      return ExpansionTile(
                                        backgroundColor: Colors.grey[300],
                                        collapsedBackgroundColor:
                                            Colors.blueGrey[300],
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              task.title,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                final argument = {
                                                  "taskType": TaskType.subTask,
                                                  "parentTaskId": task.taskId,
                                                };
                                                Navigator.pushNamed(
                                                  context,
                                                  "/add_task",
                                                  arguments: argument,
                                                );
                                              },
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Colors.black,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Add",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 16,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        subtitle: Text(task.description),
                                        leading: Text(task.time),
                                        showTrailingIcon: subTasks != null,
                                        childrenPadding:
                                            EdgeInsets.only(top: 12, left: 12),
                                        children: subTasks == null
                                            ? []
                                            : List.generate(
                                                subTasks.length,
                                                (index) {
                                                  final subTask =
                                                      subTasks[index];
                                                  final subTask2s =
                                                      subTask.subtasks;

                                                  // sub tasks
                                                  return ExpansionTile(
                                                    backgroundColor:
                                                        Colors.brown[300],
                                                    collapsedBackgroundColor:
                                                        Colors.deepOrangeAccent[
                                                            300],
                                                    title: Text(subTask.title),
                                                    subtitle: Text(
                                                        subTask.description),
                                                    leading: Text(subTask.time),
                                                    showTrailingIcon:
                                                        subTask2s != null,
                                                    childrenPadding:
                                                        EdgeInsets.only(
                                                            left: 20, top: 8),
                                                    children: subTask2s == null
                                                        ? []
                                                        : List.generate(
                                                            subTask2s.length,
                                                            (index) {
                                                              final subTask2 =
                                                                  subTask2s[
                                                                      index];

                                                              // Sub tasks 2
                                                              return ExpansionTile(
                                                                backgroundColor:
                                                                    Colors.blue[
                                                                        100],
                                                                collapsedBackgroundColor:
                                                                    Colors.blueAccent[
                                                                        100],
                                                                title: Text(
                                                                    subTask2
                                                                        .title),
                                                                subtitle: Text(
                                                                    subTask2
                                                                        .description),
                                                                leading: Text(
                                                                    subTask2
                                                                        .time),
                                                                showTrailingIcon:
                                                                    false,
                                                                childrenPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12),
                                                              );
                                                            },
                                                          ),
                                                  );
                                                },
                                              ),
                                      );
                                    },
                                  ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 25,
                          );
                        },
                        itemCount: _taskDocuments!.length,
                      ),

                    // progress bar
                    if (_showProgressBar)
                      Center(child: const CircularProgressIndicator()),

                    // Api fetching error
                    if (_apiFetchingErrorMessage != null)
                      Center(
                        child: Text(
                          _apiFetchingErrorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      )
                  ],
                )),
          );
        },
      ),
    );
  }
}
