import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:niz_corp/util/log_functions.dart';

class FirebaseRepository {
  final FirebaseFirestore fdb = FirebaseFirestore.instance;

  // Future addInitialTasks({
  //   required List<Map<String, dynamic>> initialTaskList,
  // }) async {
  //   String functionName = StackTrace.current.toString().split("\n")[0];
  //   try {
  //     final taskCollection = fdb.collection("tasks");
  //     final WriteBatch batch = fdb.batch();

  //     for (var task in initialTaskList) {
  //       final DocumentReference docRef =
  //           taskCollection.doc(); // Auto-generate document ID
  //       batch.set(docRef, task);
  //     }

  //     await batch.commit();
  //     warningLog(functionName: functionName, message: "Initial task added");
  //   } catch (e) {
  //     errorLog(functionName: functionName, error: "$e");
  //     rethrow;
  //   }
  // }

  Future<bool> addATaskDocument({
    required Map<String, dynamic> task,
  }) async {
    String functionName = StackTrace.current.toString().split("\n")[0];
    try {
      final taskCollection = fdb.collection("tasks");
      await taskCollection.add(task);
      warningLog(functionName: functionName, message: "Task added");
      return true;
    } catch (e) {
      errorLog(functionName: functionName, error: "$e");
      rethrow;
    }
  }

  Future<List<QueryDocumentSnapshot>> getAllAddedTaskDocuments(
  ) async {
    String functionName = StackTrace.current.toString().split("\n")[0];
    try {
      final taskCollection = fdb.collection("tasks");
      final querySnapshot = await taskCollection.get();
      warningLog(functionName: functionName, message: "${querySnapshot.docs.length} tasks fetched");
      return querySnapshot.docs;
    } catch (e) {
      errorLog(functionName: functionName, error: "$e");
      rethrow;
    }
  }
}
