// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      description: json['description'] as String,
      taskId: (json['taskId'] as num).toInt(),
      time: json['time'] as String,
      title: json['title'] as String,
      subtasks: (json['subtasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'taskId': instance.taskId,
      'time': instance.time,
      'title': instance.title,
      'subtasks': instance.subtasks,
    };
