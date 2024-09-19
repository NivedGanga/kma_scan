import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kma_reg/domain/api_calls/i_api_calls_repo.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/domain/checkin_type/check_in_type.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';
part 'check_state.dart';
part 'check_cubit.freezed.dart';

@injectable
class CheckCubit extends Cubit<CheckState> {
  final IApiCallsRepo _apiCallsRepo;
  CheckCubit(this._apiCallsRepo) : super(CheckState.initial());
  check({required String token, required CheckInType checkInType}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _apiCallsRepo.checkInGet(token: token);
    result.fold((l) {
      emit(state.copyWith(isLoading: false, isSuccessorFailrue: some(left(l))));
    }, (r) {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccessorFailrue: some(right(null)),
          updateCountModel: r,
        ),
      );
    });
  }
  checkWithTransactionId({required String transactionId}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _apiCallsRepo.checkInGetWithTransactionId(transactionId: transactionId);
    result.fold((l) {
      emit(state.copyWith(isLoading: false, isSuccessorFailrue: some(left(l))));
    }, (r) {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccessorFailrue: some(right(null)),
          updateCountModel: r,
        ),
      );
    });
  }
  resetState() {
    emit(CheckState.initial());
  }
}
