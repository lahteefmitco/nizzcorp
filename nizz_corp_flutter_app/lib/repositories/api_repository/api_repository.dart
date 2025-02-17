import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:niz_corp/main.dart';
import 'package:niz_corp/models/task_document/task_document.dart';
import 'package:niz_corp/util/http_routes.dart';
import 'package:niz_corp/util/log_functions.dart';

class ApiRepository {
  final Dio dio;

  ApiRepository({required this.dio});
  


  Future<List<TaskDocument>> getInitialTasks() async {
    String functionName = StackTrace.current.toString().split("\n")[0];

    try {
      final response = await dio.get(HttpRoutes.getInitialTaskUrl);
      if (response.statusCode == 200) {
        final responseData = response.data;
        final dynamicList = jsonDecode(responseData) as List<dynamic>;

        final List<Map<String, dynamic>> data = dynamicList
            .map((element) => element as Map<String, dynamic>)
            .toList();
        final List<TaskDocument> listOfTaskDocuments =
            data.map((json) => TaskDocument.fromJson(json)).toList();

        return listOfTaskDocuments;
      } else {
        throw Exception("Un expected Excption while fetching initial tasks");
      }
    } catch (e) {
      errorLog(functionName: functionName, error: e.toString());
      rethrow;
    }
  }

  Future<String> sendFcmToken(Map<String, dynamic> task) async {
    String functionName = StackTrace.current.toString().split("\n")[0];
    try {
      final token = prefs.getString("fcmToken");
      if (token != null) {
        final title = task["title"].toString();
        final body = task["description"].toString();
        final response = await dio.post(
         HttpRoutes. notificationUrl ,
          data: {
            "title": title,
            "body": body,
            "token": token,
          },
        );
        if (response.statusCode == 200) {
          infoLog(functionName: functionName, message: response.data);
          return response.data.toString();
        } else {
          throw Exception("UnExpected error while sending fcm token to server");
        }
      } else {
        throw Exception("FCM token is null");
      }
    } catch (e) {
      errorLog(functionName: functionName, error: e.toString());
      rethrow;
    }
  }
}
