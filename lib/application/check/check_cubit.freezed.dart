// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, void>> get isSuccessorFailrue =>
      throw _privateConstructorUsedError;
  UpdateCountModel? get updateCountModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckStateCopyWith<CheckState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckStateCopyWith<$Res> {
  factory $CheckStateCopyWith(
          CheckState value, $Res Function(CheckState) then) =
      _$CheckStateCopyWithImpl<$Res, CheckState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, void>> isSuccessorFailrue,
      UpdateCountModel? updateCountModel});
}

/// @nodoc
class _$CheckStateCopyWithImpl<$Res, $Val extends CheckState>
    implements $CheckStateCopyWith<$Res> {
  _$CheckStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessorFailrue = null,
    Object? updateCountModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessorFailrue: null == isSuccessorFailrue
          ? _value.isSuccessorFailrue
          : isSuccessorFailrue // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
      updateCountModel: freezed == updateCountModel
          ? _value.updateCountModel
          : updateCountModel // ignore: cast_nullable_to_non_nullable
              as UpdateCountModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CheckStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, void>> isSuccessorFailrue,
      UpdateCountModel? updateCountModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CheckStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessorFailrue = null,
    Object? updateCountModel = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessorFailrue: null == isSuccessorFailrue
          ? _value.isSuccessorFailrue
          : isSuccessorFailrue // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
      updateCountModel: freezed == updateCountModel
          ? _value.updateCountModel
          : updateCountModel // ignore: cast_nullable_to_non_nullable
              as UpdateCountModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isSuccessorFailrue,
      required this.updateCountModel});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, void>> isSuccessorFailrue;
  @override
  final UpdateCountModel? updateCountModel;

  @override
  String toString() {
    return 'CheckState(isLoading: $isLoading, isSuccessorFailrue: $isSuccessorFailrue, updateCountModel: $updateCountModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessorFailrue, isSuccessorFailrue) ||
                other.isSuccessorFailrue == isSuccessorFailrue) &&
            (identical(other.updateCountModel, updateCountModel) ||
                other.updateCountModel == updateCountModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccessorFailrue, updateCountModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CheckState {
  const factory _Initial(
      {required final bool isLoading,
      required final Option<Either<MainFailure, void>> isSuccessorFailrue,
      required final UpdateCountModel? updateCountModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, void>> get isSuccessorFailrue;
  @override
  UpdateCountModel? get updateCountModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
