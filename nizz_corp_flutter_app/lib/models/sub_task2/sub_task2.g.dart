// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubTask2Impl _$$SubTask2ImplFromJson(Map<String, dynamic> json) =>
    _$SubTask2Impl(
      description: json['description'] as String,
      taskId: (json['taskId'] as num).toInt(),
      time: json['time'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$SubTask2ImplToJson(_$SubTask2Impl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'taskId': instance.taskId,
      'time': instance.time,
      'title': instance.title,
    };
