// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubTask _$SubTaskFromJson(Map<String, dynamic> json) {
  return _SubTask.fromJson(json);
}

/// @nodoc
mixin _$SubTask {
  String get description => throw _privateConstructorUsedError;
  int get taskId => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<SubTask2>? get subtasks => throw _privateConstructorUsedError;

  /// Serializes this SubTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubTaskCopyWith<SubTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubTaskCopyWith<$Res> {
  factory $SubTaskCopyWith(SubTask value, $Res Function(SubTask) then) =
      _$SubTaskCopyWithImpl<$Res, SubTask>;
  @useResult
  $Res call(
      {String description,
      int taskId,
      String time,
      String title,
      List<SubTask2>? subtasks});
}

/// @nodoc
class _$SubTaskCopyWithImpl<$Res, $Val extends SubTask>
    implements $SubTaskCopyWith<$Res> {
  _$SubTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? taskId = null,
    Object? time = null,
    Object? title = null,
    Object? subtasks = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtasks: freezed == subtasks
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubTask2>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubTaskImplCopyWith<$Res> implements $SubTaskCopyWith<$Res> {
  factory _$$SubTaskImplCopyWith(
          _$SubTaskImpl value, $Res Function(_$SubTaskImpl) then) =
      __$$SubTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      int taskId,
      String time,
      String title,
      List<SubTask2>? subtasks});
}

/// @nodoc
class __$$SubTaskImplCopyWithImpl<$Res>
    extends _$SubTaskCopyWithImpl<$Res, _$SubTaskImpl>
    implements _$$SubTaskImplCopyWith<$Res> {
  __$$SubTaskImplCopyWithImpl(
      _$SubTaskImpl _value, $Res Function(_$SubTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? taskId = null,
    Object? time = null,
    Object? title = null,
    Object? subtasks = freezed,
  }) {
    return _then(_$SubTaskImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtasks: freezed == subtasks
          ? _value._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubTask2>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubTaskImpl implements _SubTask {
  _$SubTaskImpl(
      {required this.description,
      required this.taskId,
      required this.time,
      required this.title,
      final List<SubTask2>? subtasks = null})
      : _subtasks = subtasks;

  factory _$SubTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubTaskImplFromJson(json);

  @override
  final String description;
  @override
  final int taskId;
  @override
  final String time;
  @override
  final String title;
  final List<SubTask2>? _subtasks;
  @override
  @JsonKey()
  List<SubTask2>? get subtasks {
    final value = _subtasks;
    if (value == null) return null;
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubTask(description: $description, taskId: $taskId, time: $time, title: $title, subtasks: $subtasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubTaskImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, taskId, time, title,
      const DeepCollectionEquality().hash(_subtasks));

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubTaskImplCopyWith<_$SubTaskImpl> get copyWith =>
      __$$SubTaskImplCopyWithImpl<_$SubTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubTaskImplToJson(
      this,
    );
  }
}

abstract class _SubTask implements SubTask {
  factory _SubTask(
      {required final String description,
      required final int taskId,
      required final String time,
      required final String title,
      final List<SubTask2>? subtasks}) = _$SubTaskImpl;

  factory _SubTask.fromJson(Map<String, dynamic> json) = _$SubTaskImpl.fromJson;

  @override
  String get description;
  @override
  int get taskId;
  @override
  String get time;
  @override
  String get title;
  @override
  List<SubTask2>? get subtasks;

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubTaskImplCopyWith<_$SubTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
