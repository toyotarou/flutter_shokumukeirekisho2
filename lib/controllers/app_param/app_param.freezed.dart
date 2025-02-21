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
  $Res call({Map<String, bool> factFakeMap, bool displayFactData});
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
  $Res call({Map<String, bool> factFakeMap, bool displayFactData});
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
    ));
  }
}

/// @nodoc

class _$AppParamStateImpl implements _AppParamState {
  const _$AppParamStateImpl(
      {final Map<String, bool> factFakeMap = const <String, bool>{},
      this.displayFactData = true})
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
  String toString() {
    return 'AppParamState(factFakeMap: $factFakeMap, displayFactData: $displayFactData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppParamStateImpl &&
            const DeepCollectionEquality()
                .equals(other._factFakeMap, _factFakeMap) &&
            (identical(other.displayFactData, displayFactData) ||
                other.displayFactData == displayFactData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_factFakeMap), displayFactData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      __$$AppParamStateImplCopyWithImpl<_$AppParamStateImpl>(this, _$identity);
}

abstract class _AppParamState implements AppParamState {
  const factory _AppParamState(
      {final Map<String, bool> factFakeMap,
      final bool displayFactData}) = _$AppParamStateImpl;

  @override
  Map<String, bool> get factFakeMap;
  @override
  bool get displayFactData;
  @override
  @JsonKey(ignore: true)
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
