// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDocument _$TaskDocumentFromJson(Map<String, dynamic> json) {
  return _TaskDocument.fromJson(json);
}

/// @nodoc
mixin _$TaskDocument {
  String get date => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;

  /// Serializes this TaskDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDocumentCopyWith<TaskDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDocumentCopyWith<$Res> {
  factory $TaskDocumentCopyWith(
          TaskDocument value, $Res Function(TaskDocument) then) =
      _$TaskDocumentCopyWithImpl<$Res, TaskDocument>;
  @useResult
  $Res call({String date, List<Task>? tasks});
}

/// @nodoc
class _$TaskDocumentCopyWithImpl<$Res, $Val extends TaskDocument>
    implements $TaskDocumentCopyWith<$Res> {
  _$TaskDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDocumentImplCopyWith<$Res>
    implements $TaskDocumentCopyWith<$Res> {
  factory _$$TaskDocumentImplCopyWith(
          _$TaskDocumentImpl value, $Res Function(_$TaskDocumentImpl) then) =
      __$$TaskDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, List<Task>? tasks});
}

/// @nodoc
class __$$TaskDocumentImplCopyWithImpl<$Res>
    extends _$TaskDocumentCopyWithImpl<$Res, _$TaskDocumentImpl>
    implements _$$TaskDocumentImplCopyWith<$Res> {
  __$$TaskDocumentImplCopyWithImpl(
      _$TaskDocumentImpl _value, $Res Function(_$TaskDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tasks = freezed,
  }) {
    return _then(_$TaskDocumentImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDocumentImpl implements _TaskDocument {
  _$TaskDocumentImpl({required this.date, final List<Task>? tasks = null})
      : _tasks = tasks;

  factory _$TaskDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDocumentImplFromJson(json);

  @override
  final String date;
  final List<Task>? _tasks;
  @override
  @JsonKey()
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskDocument(date: $date, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDocumentImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDocumentImplCopyWith<_$TaskDocumentImpl> get copyWith =>
      __$$TaskDocumentImplCopyWithImpl<_$TaskDocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDocumentImplToJson(
      this,
    );
  }
}

abstract class _TaskDocument implements TaskDocument {
  factory _TaskDocument({required final String date, final List<Task>? tasks}) =
      _$TaskDocumentImpl;

  factory _TaskDocument.fromJson(Map<String, dynamic> json) =
      _$TaskDocumentImpl.fromJson;

  @override
  String get date;
  @override
  List<Task>? get tasks;

  /// Create a copy of TaskDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDocumentImplCopyWith<_$TaskDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
