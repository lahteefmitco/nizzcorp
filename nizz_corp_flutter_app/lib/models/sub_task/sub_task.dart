import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:niz_corp/models/sub_task2/sub_task2.dart';

part 'sub_task.freezed.dart';
part 'sub_task.g.dart';

@freezed
class SubTask with _$SubTask {

  factory SubTask({
    required String description,
    required int taskId,
    required String time,
    required String title,
    @Default(null) List<SubTask2>? subtasks
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, dynamic> json) => _$SubTaskFromJson(json);
}