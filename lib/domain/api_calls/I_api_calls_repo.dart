import 'package:dartz/dartz.dart';
import 'package:kma_reg/domain/api_calls/models/check_model.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/domain/api_calls/models/total_check_in.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';

abstract class IApiCallsRepo {
  Future<Either<MainFailure, CheckedInModel>> checkInGet({required String token});
  Future<Either<MainFailure, CheckInCountModel>> checkIncount();
  Future<Either<MainFailure, CheckedInModel>> checkInGetWithTransactionId({required String transactionId});
}
