import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:niz_corp/repositories/firebase_repository/firebase_repository.dart';
import 'package:niz_corp/screens/added_tasks_screen/cubit/added_tasks_cubit.dart';
import 'package:niz_corp/util/general_function.dart';

class AddedTasksScreen extends StatefulWidget {
  const AddedTasksScreen({super.key});

  @override
  State<AddedTasksScreen> createState() => _AddedTasksScreenState();
}

class _AddedTasksScreenState extends State<AddedTasksScreen> {
  List<QueryDocumentSnapshot>? _documentSnapshots;
  bool _showProgressBar = false;
  String? _errorMessage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddedTasksCubit(
          firebaseRepository: context.read<FirebaseRepository>()),
      child: BlocConsumer<AddedTasksCubit, AddedTasksState>(
        listenWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            listenerStates: (a) => true,
          );
        },
        listener: (context, state) {
          state.mapOrNull(listenerStates: (value) {
            final errorMessage = value.errorMessage;
            if (errorMessage != null) {
              showSnackBar(context: context, message: errorMessage);
            }
          });
        },
        buildWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            buildStates: (a, b, c) => true,
          );
        },
        builder: (context, state) {
          state.mapOrNull(
            buildStates: (value) {
              _documentSnapshots = value.data;

              _showProgressBar = value.showProgressBar;
              _errorMessage = value.errorMessage;
            },
          );
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Added Tasks"),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    if (_documentSnapshots != null &&
                        _documentSnapshots!.isEmpty)
                      Center(
                        child: Text("No tasks"),
                      ),

                    // Showing error Message
                    if (_errorMessage != null)
                      Center(
                        child: Text(_errorMessage!),
                      ),

                    // Showing data
                    if (_documentSnapshots != null &&
                        _documentSnapshots!.isNotEmpty)
                      ListView.separated(
                        itemBuilder: (context, index) {
                          final data = _documentSnapshots![0].data()
                              as Map<String, dynamic>;

                          return Card(
                            child: ListTile(
                              trailing: Text(data["date"]),
                              leading: Text(data["time"].toString()),
                              title: Text(data['title'] ?? 'No Title'),
                              subtitle:
                                  Text(data['description'] ?? 'No Description'),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 8,
                          );
                        },
                        itemCount: _documentSnapshots!.length,
                      ),


                      // Showing progressbar
                    if (_showProgressBar)
                      Center(child: const CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
