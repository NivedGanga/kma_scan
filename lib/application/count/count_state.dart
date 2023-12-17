part of 'count_cubit.dart';

@freezed
class CountState with _$CountState {
  const factory CountState({
    required bool isLoading,
    required Option<Either<MainFailure, CheckInCountModel>>
        isSuccessOrFailureOption,
    required CheckInCountModel? checkInCountModel,
  }) = _CountState;
  factory CountState.initial() => CountState(
        isLoading: false,
        isSuccessOrFailureOption: none(),
        checkInCountModel: null,
      );
}
