import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kma_reg/domain/api_calls/I_api_calls_repo.dart';
import 'package:kma_reg/domain/api_calls/models/total_check_in.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';

part 'count_state.dart';
part 'count_cubit.freezed.dart';

@injectable
class CountCubit extends Cubit<CountState> {
  final IApiCallsRepo _apiCallsRepo;
  CountCubit(this._apiCallsRepo) : super(CountState.initial());
  fetchCount() async {
    emit(state.copyWith(
      isLoading: true,
      isSuccessOrFailureOption: none(),
      checkInCountModel: null,
    ));
    final result = await _apiCallsRepo.checkIncount();
    result.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isSuccessOrFailureOption: some(left(l)),
        checkInCountModel: null,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isSuccessOrFailureOption: some(right(r)),
        checkInCountModel: r,
      ));
    });
  }
}
