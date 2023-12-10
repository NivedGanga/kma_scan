import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kma_reg/domain/checkin_type/check_in_type.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';
part 'check_state.dart';
part 'check_cubit.freezed.dart';

@injectable
class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState.initial());
  check({required String id, required CheckInType checkInType}) async {
    emit(state.copyWith(isLoading: true));
    print(id);
    await Future.delayed(Duration(seconds: 2));
    if (id == "https://www.google.com") {
    } else {}
    emit(
      state.copyWith(
        isLoading: false,
        isSuccessorFailrue: some(
          right(null),
        ),
      ),
    );
  }

  resetState() {
    emit(CheckState.initial());
  }
}
