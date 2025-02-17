// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubTaskImpl _$$SubTaskImplFromJson(Map<String, dynamic> json) =>
    _$SubTaskImpl(
      description: json['description'] as String,
      taskId: (json['taskId'] as num).toInt(),
      time: json['time'] as String,
      title: json['title'] as String,
      subtasks: (json['subtasks'] as List<dynamic>?)
              ?.map((e) => SubTask2.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$SubTaskImplToJson(_$SubTaskImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'taskId': instance.taskId,
      'time': instance.time,
      'title': instance.title,
      'subtasks': instance.subtasks,
    };
