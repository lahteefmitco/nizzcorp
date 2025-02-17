import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {

  factory Task({
    required String description,
    required int taskId,
    required String time,
    required String title,
    @Default(null) List<Task>? subtasks
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}