part of 'set_count_cubit.dart';

@freezed
class SetCountState with _$SetCountState {
  const factory SetCountState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isSuccessorFailrue,
    required CheckedInModel? checkedInModel,
  }) = _SetCountState;
  factory SetCountState.initial() => SetCountState(
        isLoading: false,
        isSuccessorFailrue: none(),
        checkedInModel: null,
      );
}
