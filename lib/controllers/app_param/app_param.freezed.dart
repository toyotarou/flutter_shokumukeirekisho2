// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppParamState {
  Map<String, bool> get factFakeMap => throw _privateConstructorUsedError;
  bool get displayFactData => throw _privateConstructorUsedError;
  int get selectDisplayReEntryAgent => throw _privateConstructorUsedError;
  int get jumpIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppParamStateCopyWith<AppParamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppParamStateCopyWith<$Res> {
  factory $AppParamStateCopyWith(
          AppParamState value, $Res Function(AppParamState) then) =
      _$AppParamStateCopyWithImpl<$Res, AppParamState>;
  @useResult
  $Res call(
      {Map<String, bool> factFakeMap,
      bool displayFactData,
      int selectDisplayReEntryAgent,
      int jumpIndex});
}

/// @nodoc
class _$AppParamStateCopyWithImpl<$Res, $Val extends AppParamState>
    implements $AppParamStateCopyWith<$Res> {
  _$AppParamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factFakeMap = null,
    Object? displayFactData = null,
    Object? selectDisplayReEntryAgent = null,
    Object? jumpIndex = null,
  }) {
    return _then(_value.copyWith(
      factFakeMap: null == factFakeMap
          ? _value.factFakeMap
          : factFakeMap // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      displayFactData: null == displayFactData
          ? _value.displayFactData
          : displayFactData // ignore: cast_nullable_to_non_nullable
              as bool,
      selectDisplayReEntryAgent: null == selectDisplayReEntryAgent
          ? _value.selectDisplayReEntryAgent
          : selectDisplayReEntryAgent // ignore: cast_nullable_to_non_nullable
              as int,
      jumpIndex: null == jumpIndex
          ? _value.jumpIndex
          : jumpIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppParamStateImplCopyWith<$Res>
    implements $AppParamStateCopyWith<$Res> {
  factory _$$AppParamStateImplCopyWith(
          _$AppParamStateImpl value, $Res Function(_$AppParamStateImpl) then) =
      __$$AppParamStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, bool> factFakeMap,
      bool displayFactData,
      int selectDisplayReEntryAgent,
      int jumpIndex});
}

/// @nodoc
class __$$AppParamStateImplCopyWithImpl<$Res>
    extends _$AppParamStateCopyWithImpl<$Res, _$AppParamStateImpl>
    implements _$$AppParamStateImplCopyWith<$Res> {
  __$$AppParamStateImplCopyWithImpl(
      _$AppParamStateImpl _value, $Res Function(_$AppParamStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factFakeMap = null,
    Object? displayFactData = null,
    Object? selectDisplayReEntryAgent = null,
    Object? jumpIndex = null,
  }) {
    return _then(_$AppParamStateImpl(
      factFakeMap: null == factFakeMap
          ? _value._factFakeMap
          : factFakeMap // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      displayFactData: null == displayFactData
          ? _value.displayFactData
          : displayFactData // ignore: cast_nullable_to_non_nullable
              as bool,
      selectDisplayReEntryAgent: null == selectDisplayReEntryAgent
          ? _value.selectDisplayReEntryAgent
          : selectDisplayReEntryAgent // ignore: cast_nullable_to_non_nullable
              as int,
      jumpIndex: null == jumpIndex
          ? _value.jumpIndex
          : jumpIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppParamStateImpl implements _AppParamState {
  const _$AppParamStateImpl(
      {final Map<String, bool> factFakeMap = const <String, bool>{},
      this.displayFactData = true,
      this.selectDisplayReEntryAgent = 0,
      this.jumpIndex = 0})
      : _factFakeMap = factFakeMap;

  final Map<String, bool> _factFakeMap;
  @override
  @JsonKey()
  Map<String, bool> get factFakeMap {
    if (_factFakeMap is EqualUnmodifiableMapView) return _factFakeMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_factFakeMap);
  }

  @override
  @JsonKey()
  final bool displayFactData;
  @override
  @JsonKey()
  final int selectDisplayReEntryAgent;
  @override
  @JsonKey()
  final int jumpIndex;

  @override
  String toString() {
    return 'AppParamState(factFakeMap: $factFakeMap, displayFactData: $displayFactData, selectDisplayReEntryAgent: $selectDisplayReEntryAgent, jumpIndex: $jumpIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppParamStateImpl &&
            const DeepCollectionEquality()
                .equals(other._factFakeMap, _factFakeMap) &&
            (identical(other.displayFactData, displayFactData) ||
                other.displayFactData == displayFactData) &&
            (identical(other.selectDisplayReEntryAgent,
                    selectDisplayReEntryAgent) ||
                other.selectDisplayReEntryAgent == selectDisplayReEntryAgent) &&
            (identical(other.jumpIndex, jumpIndex) ||
                other.jumpIndex == jumpIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_factFakeMap),
      displayFactData,
      selectDisplayReEntryAgent,
      jumpIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      __$$AppParamStateImplCopyWithImpl<_$AppParamStateImpl>(this, _$identity);
}

abstract class _AppParamState implements AppParamState {
  const factory _AppParamState(
      {final Map<String, bool> factFakeMap,
      final bool displayFactData,
      final int selectDisplayReEntryAgent,
      final int jumpIndex}) = _$AppParamStateImpl;

  @override
  Map<String, bool> get factFakeMap;
  @override
  bool get displayFactData;
  @override
  int get selectDisplayReEntryAgent;
  @override
  int get jumpIndex;
  @override
  @JsonKey(ignore: true)
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
