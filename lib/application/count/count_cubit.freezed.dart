// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, CheckInCountModel>> get isSuccessOrFailureOption =>
      throw _privateConstructorUsedError;
  CheckInCountModel? get checkInCountModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountStateCopyWith<CountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountStateCopyWith<$Res> {
  factory $CountStateCopyWith(
          CountState value, $Res Function(CountState) then) =
      _$CountStateCopyWithImpl<$Res, CountState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, CheckInCountModel>> isSuccessOrFailureOption,
      CheckInCountModel? checkInCountModel});
}

/// @nodoc
class _$CountStateCopyWithImpl<$Res, $Val extends CountState>
    implements $CountStateCopyWith<$Res> {
  _$CountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessOrFailureOption = null,
    Object? checkInCountModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessOrFailureOption: null == isSuccessOrFailureOption
          ? _value.isSuccessOrFailureOption
          : isSuccessOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, CheckInCountModel>>,
      checkInCountModel: freezed == checkInCountModel
          ? _value.checkInCountModel
          : checkInCountModel // ignore: cast_nullable_to_non_nullable
              as CheckInCountModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountStateImplCopyWith<$Res>
    implements $CountStateCopyWith<$Res> {
  factory _$$CountStateImplCopyWith(
          _$CountStateImpl value, $Res Function(_$CountStateImpl) then) =
      __$$CountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, CheckInCountModel>> isSuccessOrFailureOption,
      CheckInCountModel? checkInCountModel});
}

/// @nodoc
class __$$CountStateImplCopyWithImpl<$Res>
    extends _$CountStateCopyWithImpl<$Res, _$CountStateImpl>
    implements _$$CountStateImplCopyWith<$Res> {
  __$$CountStateImplCopyWithImpl(
      _$CountStateImpl _value, $Res Function(_$CountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessOrFailureOption = null,
    Object? checkInCountModel = freezed,
  }) {
    return _then(_$CountStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessOrFailureOption: null == isSuccessOrFailureOption
          ? _value.isSuccessOrFailureOption
          : isSuccessOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, CheckInCountModel>>,
      checkInCountModel: freezed == checkInCountModel
          ? _value.checkInCountModel
          : checkInCountModel // ignore: cast_nullable_to_non_nullable
              as CheckInCountModel?,
    ));
  }
}

/// @nodoc

class _$CountStateImpl implements _CountState {
  const _$CountStateImpl(
      {required this.isLoading,
      required this.isSuccessOrFailureOption,
      required this.checkInCountModel});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, CheckInCountModel>> isSuccessOrFailureOption;
  @override
  final CheckInCountModel? checkInCountModel;

  @override
  String toString() {
    return 'CountState(isLoading: $isLoading, isSuccessOrFailureOption: $isSuccessOrFailureOption, checkInCountModel: $checkInCountModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                    other.isSuccessOrFailureOption, isSuccessOrFailureOption) ||
                other.isSuccessOrFailureOption == isSuccessOrFailureOption) &&
            (identical(other.checkInCountModel, checkInCountModel) ||
                other.checkInCountModel == checkInCountModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isSuccessOrFailureOption, checkInCountModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountStateImplCopyWith<_$CountStateImpl> get copyWith =>
      __$$CountStateImplCopyWithImpl<_$CountStateImpl>(this, _$identity);
}

abstract class _CountState implements CountState {
  const factory _CountState(
      {required final bool isLoading,
      required final Option<Either<MainFailure, CheckInCountModel>>
          isSuccessOrFailureOption,
      required final CheckInCountModel? checkInCountModel}) = _$CountStateImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, CheckInCountModel>> get isSuccessOrFailureOption;
  @override
  CheckInCountModel? get checkInCountModel;
  @override
  @JsonKey(ignore: true)
  _$$CountStateImplCopyWith<_$CountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
