import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_task2.freezed.dart';
part 'sub_task2.g.dart';

@freezed
class SubTask2 with _$SubTask2 {

  factory SubTask2({
    required String description,
    required int taskId,
    required String time,
    required String title,
  }) = _SubTask2;

  factory SubTask2.fromJson(Map<String, dynamic> json) => _$SubTask2FromJson(json);
}