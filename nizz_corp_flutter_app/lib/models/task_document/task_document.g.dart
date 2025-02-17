// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDocumentImpl _$$TaskDocumentImplFromJson(Map<String, dynamic> json) =>
    _$TaskDocumentImpl(
      date: json['date'] as String,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$TaskDocumentImplToJson(_$TaskDocumentImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'tasks': instance.tasks,
    };
