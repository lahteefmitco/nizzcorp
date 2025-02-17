import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:niz_corp/models/task/task.dart';

part 'task_document.freezed.dart';
part 'task_document.g.dart';

@freezed
class TaskDocument with _$TaskDocument {

  factory TaskDocument({
    required String date,
    @Default(null) List<Task>? tasks,
  }) = _TaskDocument;

  factory TaskDocument.fromJson(Map<String, dynamic> json) => _$TaskDocumentFromJson(json);
}