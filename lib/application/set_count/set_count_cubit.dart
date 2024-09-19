import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kma_reg/domain/api_calls/i_api_calls_repo.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';

part 'set_count_state.dart';
part 'set_count_cubit.freezed.dart';

@injectable
class SetCountCubit extends Cubit<SetCountState> {
  final IApiCallsRepo iApiCallsRepo;
  SetCountCubit(this.iApiCallsRepo) : super(SetCountState.initial());
  updateCount(
      {required int count, required UpdateCountModel updateCountModel}) async {
    emit(state.copyWith(isLoading: true));
    final result = await iApiCallsRepo.updateCount(
        count: count, updateCountModel: updateCountModel);
    result.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccessorFailrue: some(
            left(l),
          ),
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccessorFailrue: some(right(null)),
          checkedInModel: r,
        ),
      );
    });
  }

  resetState() {
    emit(SetCountState.initial());
  }
}
