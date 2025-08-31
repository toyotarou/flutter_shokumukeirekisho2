// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_anken.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkAnkenState {
  List<WorkAnkenModel> get workAnkenList => throw _privateConstructorUsedError;
  Map<String, WorkAnkenModel> get workAnkenMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of WorkAnkenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkAnkenStateCopyWith<WorkAnkenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkAnkenStateCopyWith<$Res> {
  factory $WorkAnkenStateCopyWith(
          WorkAnkenState value, $Res Function(WorkAnkenState) then) =
      _$WorkAnkenStateCopyWithImpl<$Res, WorkAnkenState>;
  @useResult
  $Res call(
      {List<WorkAnkenModel> workAnkenList,
      Map<String, WorkAnkenModel> workAnkenMap});
}

/// @nodoc
class _$WorkAnkenStateCopyWithImpl<$Res, $Val extends WorkAnkenState>
    implements $WorkAnkenStateCopyWith<$Res> {
  _$WorkAnkenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkAnkenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workAnkenList = null,
    Object? workAnkenMap = null,
  }) {
    return _then(_value.copyWith(
      workAnkenList: null == workAnkenList
          ? _value.workAnkenList
          : workAnkenList // ignore: cast_nullable_to_non_nullable
              as List<WorkAnkenModel>,
      workAnkenMap: null == workAnkenMap
          ? _value.workAnkenMap
          : workAnkenMap // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkAnkenModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkAnkenStateImplCopyWith<$Res>
    implements $WorkAnkenStateCopyWith<$Res> {
  factory _$$WorkAnkenStateImplCopyWith(_$WorkAnkenStateImpl value,
          $Res Function(_$WorkAnkenStateImpl) then) =
      __$$WorkAnkenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WorkAnkenModel> workAnkenList,
      Map<String, WorkAnkenModel> workAnkenMap});
}

/// @nodoc
class __$$WorkAnkenStateImplCopyWithImpl<$Res>
    extends _$WorkAnkenStateCopyWithImpl<$Res, _$WorkAnkenStateImpl>
    implements _$$WorkAnkenStateImplCopyWith<$Res> {
  __$$WorkAnkenStateImplCopyWithImpl(
      _$WorkAnkenStateImpl _value, $Res Function(_$WorkAnkenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkAnkenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workAnkenList = null,
    Object? workAnkenMap = null,
  }) {
    return _then(_$WorkAnkenStateImpl(
      workAnkenList: null == workAnkenList
          ? _value._workAnkenList
          : workAnkenList // ignore: cast_nullable_to_non_nullable
              as List<WorkAnkenModel>,
      workAnkenMap: null == workAnkenMap
          ? _value._workAnkenMap
          : workAnkenMap // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkAnkenModel>,
    ));
  }
}

/// @nodoc

class _$WorkAnkenStateImpl implements _WorkAnkenState {
  const _$WorkAnkenStateImpl(
      {final List<WorkAnkenModel> workAnkenList = const <WorkAnkenModel>[],
      final Map<String, WorkAnkenModel> workAnkenMap =
          const <String, WorkAnkenModel>{}})
      : _workAnkenList = workAnkenList,
        _workAnkenMap = workAnkenMap;

  final List<WorkAnkenModel> _workAnkenList;
  @override
  @JsonKey()
  List<WorkAnkenModel> get workAnkenList {
    if (_workAnkenList is EqualUnmodifiableListView) return _workAnkenList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workAnkenList);
  }

  final Map<String, WorkAnkenModel> _workAnkenMap;
  @override
  @JsonKey()
  Map<String, WorkAnkenModel> get workAnkenMap {
    if (_workAnkenMap is EqualUnmodifiableMapView) return _workAnkenMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workAnkenMap);
  }

  @override
  String toString() {
    return 'WorkAnkenState(workAnkenList: $workAnkenList, workAnkenMap: $workAnkenMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkAnkenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._workAnkenList, _workAnkenList) &&
            const DeepCollectionEquality()
                .equals(other._workAnkenMap, _workAnkenMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workAnkenList),
      const DeepCollectionEquality().hash(_workAnkenMap));

  /// Create a copy of WorkAnkenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkAnkenStateImplCopyWith<_$WorkAnkenStateImpl> get copyWith =>
      __$$WorkAnkenStateImplCopyWithImpl<_$WorkAnkenStateImpl>(
          this, _$identity);
}

abstract class _WorkAnkenState implements WorkAnkenState {
  const factory _WorkAnkenState(
      {final List<WorkAnkenModel> workAnkenList,
      final Map<String, WorkAnkenModel> workAnkenMap}) = _$WorkAnkenStateImpl;

  @override
  List<WorkAnkenModel> get workAnkenList;
  @override
  Map<String, WorkAnkenModel> get workAnkenMap;

  /// Create a copy of WorkAnkenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkAnkenStateImplCopyWith<_$WorkAnkenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
