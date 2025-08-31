// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkContractState {
  List<WorkContractModel> get workContractList =>
      throw _privateConstructorUsedError;
  Map<String, WorkContractModel> get workContractMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of WorkContractState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkContractStateCopyWith<WorkContractState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkContractStateCopyWith<$Res> {
  factory $WorkContractStateCopyWith(
          WorkContractState value, $Res Function(WorkContractState) then) =
      _$WorkContractStateCopyWithImpl<$Res, WorkContractState>;
  @useResult
  $Res call(
      {List<WorkContractModel> workContractList,
      Map<String, WorkContractModel> workContractMap});
}

/// @nodoc
class _$WorkContractStateCopyWithImpl<$Res, $Val extends WorkContractState>
    implements $WorkContractStateCopyWith<$Res> {
  _$WorkContractStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkContractState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workContractList = null,
    Object? workContractMap = null,
  }) {
    return _then(_value.copyWith(
      workContractList: null == workContractList
          ? _value.workContractList
          : workContractList // ignore: cast_nullable_to_non_nullable
              as List<WorkContractModel>,
      workContractMap: null == workContractMap
          ? _value.workContractMap
          : workContractMap // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkContractModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkContractStateImplCopyWith<$Res>
    implements $WorkContractStateCopyWith<$Res> {
  factory _$$WorkContractStateImplCopyWith(_$WorkContractStateImpl value,
          $Res Function(_$WorkContractStateImpl) then) =
      __$$WorkContractStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WorkContractModel> workContractList,
      Map<String, WorkContractModel> workContractMap});
}

/// @nodoc
class __$$WorkContractStateImplCopyWithImpl<$Res>
    extends _$WorkContractStateCopyWithImpl<$Res, _$WorkContractStateImpl>
    implements _$$WorkContractStateImplCopyWith<$Res> {
  __$$WorkContractStateImplCopyWithImpl(_$WorkContractStateImpl _value,
      $Res Function(_$WorkContractStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkContractState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workContractList = null,
    Object? workContractMap = null,
  }) {
    return _then(_$WorkContractStateImpl(
      workContractList: null == workContractList
          ? _value._workContractList
          : workContractList // ignore: cast_nullable_to_non_nullable
              as List<WorkContractModel>,
      workContractMap: null == workContractMap
          ? _value._workContractMap
          : workContractMap // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkContractModel>,
    ));
  }
}

/// @nodoc

class _$WorkContractStateImpl implements _WorkContractState {
  const _$WorkContractStateImpl(
      {final List<WorkContractModel> workContractList =
          const <WorkContractModel>[],
      final Map<String, WorkContractModel> workContractMap =
          const <String, WorkContractModel>{}})
      : _workContractList = workContractList,
        _workContractMap = workContractMap;

  final List<WorkContractModel> _workContractList;
  @override
  @JsonKey()
  List<WorkContractModel> get workContractList {
    if (_workContractList is EqualUnmodifiableListView)
      return _workContractList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workContractList);
  }

  final Map<String, WorkContractModel> _workContractMap;
  @override
  @JsonKey()
  Map<String, WorkContractModel> get workContractMap {
    if (_workContractMap is EqualUnmodifiableMapView) return _workContractMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workContractMap);
  }

  @override
  String toString() {
    return 'WorkContractState(workContractList: $workContractList, workContractMap: $workContractMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkContractStateImpl &&
            const DeepCollectionEquality()
                .equals(other._workContractList, _workContractList) &&
            const DeepCollectionEquality()
                .equals(other._workContractMap, _workContractMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workContractList),
      const DeepCollectionEquality().hash(_workContractMap));

  /// Create a copy of WorkContractState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkContractStateImplCopyWith<_$WorkContractStateImpl> get copyWith =>
      __$$WorkContractStateImplCopyWithImpl<_$WorkContractStateImpl>(
          this, _$identity);
}

abstract class _WorkContractState implements WorkContractState {
  const factory _WorkContractState(
          {final List<WorkContractModel> workContractList,
          final Map<String, WorkContractModel> workContractMap}) =
      _$WorkContractStateImpl;

  @override
  List<WorkContractModel> get workContractList;
  @override
  Map<String, WorkContractModel> get workContractMap;

  /// Create a copy of WorkContractState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkContractStateImplCopyWith<_$WorkContractStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
