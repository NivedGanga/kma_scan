import 'package:dartz/dartz.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/domain/api_calls/models/total_check_in.dart';
import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';

abstract class IApiCallsRepo {
  Future<Either<MainFailure,UpdateCountModel >> checkInGet(
      {required String token});
  Future<Either<MainFailure, CheckedInModel>> updateCount({required int count,required UpdateCountModel updateCountModel});
  Future<Either<MainFailure, CheckInCountModel>> checkIncount();
  Future<Either<MainFailure, UpdateCountModel>> checkInGetWithTransactionId(
      {required String transactionId});
}
