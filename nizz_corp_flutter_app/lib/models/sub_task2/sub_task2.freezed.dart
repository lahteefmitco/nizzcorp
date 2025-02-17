// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_task2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubTask2 _$SubTask2FromJson(Map<String, dynamic> json) {
  return _SubTask2.fromJson(json);
}

/// @nodoc
mixin _$SubTask2 {
  String get description => throw _privateConstructorUsedError;
  int get taskId => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this SubTask2 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubTask2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubTask2CopyWith<SubTask2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubTask2CopyWith<$Res> {
  factory $SubTask2CopyWith(SubTask2 value, $Res Function(SubTask2) then) =
      _$SubTask2CopyWithImpl<$Res, SubTask2>;
  @useResult
  $Res call({String description, int taskId, String time, String title});
}

/// @nodoc
class _$SubTask2CopyWithImpl<$Res, $Val extends SubTask2>
    implements $SubTask2CopyWith<$Res> {
  _$SubTask2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubTask2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? taskId = null,
    Object? time = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubTask2ImplCopyWith<$Res>
    implements $SubTask2CopyWith<$Res> {
  factory _$$SubTask2ImplCopyWith(
          _$SubTask2Impl value, $Res Function(_$SubTask2Impl) then) =
      __$$SubTask2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, int taskId, String time, String title});
}

/// @nodoc
class __$$SubTask2ImplCopyWithImpl<$Res>
    extends _$SubTask2CopyWithImpl<$Res, _$SubTask2Impl>
    implements _$$SubTask2ImplCopyWith<$Res> {
  __$$SubTask2ImplCopyWithImpl(
      _$SubTask2Impl _value, $Res Function(_$SubTask2Impl) _then)
      : super(_value, _then);

  /// Create a copy of SubTask2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? taskId = null,
    Object? time = null,
    Object? title = null,
  }) {
    return _then(_$SubTask2Impl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubTask2Impl implements _SubTask2 {
  _$SubTask2Impl(
      {required this.description,
      required this.taskId,
      required this.time,
      required this.title});

  factory _$SubTask2Impl.fromJson(Map<String, dynamic> json) =>
      _$$SubTask2ImplFromJson(json);

  @override
  final String description;
  @override
  final int taskId;
  @override
  final String time;
  @override
  final String title;

  @override
  String toString() {
    return 'SubTask2(description: $description, taskId: $taskId, time: $time, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubTask2Impl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, taskId, time, title);

  /// Create a copy of SubTask2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubTask2ImplCopyWith<_$SubTask2Impl> get copyWith =>
      __$$SubTask2ImplCopyWithImpl<_$SubTask2Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubTask2ImplToJson(
      this,
    );
  }
}

abstract class _SubTask2 implements SubTask2 {
  factory _SubTask2(
      {required final String description,
      required final int taskId,
      required final String time,
      required final String title}) = _$SubTask2Impl;

  factory _SubTask2.fromJson(Map<String, dynamic> json) =
      _$SubTask2Impl.fromJson;

  @override
  String get description;
  @override
  int get taskId;
  @override
  String get time;
  @override
  String get title;

  /// Create a copy of SubTask2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubTask2ImplCopyWith<_$SubTask2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
