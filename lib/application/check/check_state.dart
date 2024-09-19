part of 'check_cubit.dart';

@freezed
class CheckState with _$CheckState {
  const factory CheckState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isSuccessorFailrue,
    required UpdateCountModel? updateCountModel,
  }) = _Initial;
  factory CheckState.initial() => CheckState(
        isLoading: false,
        isSuccessorFailrue: none(),
        updateCountModel: null,
      );
}
