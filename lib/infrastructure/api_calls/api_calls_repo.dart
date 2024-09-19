import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kma_reg/core/base_url.dart';
import 'package:kma_reg/domain/api_calls/i_api_calls_repo.dart';
import 'package:kma_reg/domain/api_calls/models/check_model.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/domain/api_calls/models/total_check_in.dart';
import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';

@LazySingleton(as: IApiCallsRepo)
class ApiCallsRepo extends IApiCallsRepo {
  @override
  Future<Either<MainFailure, UpdateCountModel>> checkInGet(
      {required String token}) async {
    final CheckInModel model;
    try {
      model = CheckInModel.fromToken(token);
    } catch (e) {
      print(e);
      return left(const MainFailure.otherFailure("Invalid QR code"));
    }

    final data = {
      'user_id': model.userId,
      'transaction_id': model.transactionId,
    };
    try {
      final result = await Dio(BaseOptions()).get(
        '$baseUrl/mob_scan/checkin/count/',
        data: data,
      );
      if (result.statusCode == 200) {
        return right(UpdateCountModel.fromJson(result.data));
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      if (e is DioException && e.response?.statusCode == 406) {
        return left(const MainFailure.otherFailure("Already checked in"));
      } else if (e is DioException && e.response?.statusCode == 404) {
        return left(const MainFailure.otherFailure("Invalid QR code"));
      } else if (e is DioException && e.response?.statusCode == 500) {
        return left(
            const MainFailure.otherFailure("Server under maintainance"));
      } else {
        return left(const MainFailure.otherFailure("Somthign went wrong"));
      }
    }
  }

  @override
  Future<Either<MainFailure, CheckInCountModel>> checkIncount() async {
    try {
      final result = await Dio(BaseOptions()).get(
        '$baseUrl/mob_scan/regcount/',
      );
      if (result.statusCode == 200) {
        return right(CheckInCountModel.fromJson(result.data));
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        return left(
          const MainFailure.otherFailure("Server under maintainance"),
        );
      }
      return left(const MainFailure.otherFailure("Somthing went wrong"));
    }
  }

  @override
  Future<Either<MainFailure, UpdateCountModel>> checkInGetWithTransactionId(
      {required String transactionId}) async {
    try {
      final result = await Dio(BaseOptions()).get(
        '$baseUrl/mob_scan/checkin/transid/',
        data: {
          'transaction_id': transactionId,
        },
      );
      if (result.statusCode == 200) {
        return right(UpdateCountModel.fromJson(result.data));
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      if (e is DioException && e.response?.statusCode == 406) {
        return left(const MainFailure.otherFailure("Already checked in"));
      } else if (e is DioException && e.response?.statusCode == 400) {
        return left(const MainFailure.otherFailure("Invalid Transaction ID"));
      } else if (e is DioException && e.response?.statusCode == 500) {
        return left(
            const MainFailure.otherFailure("Server under maintainance"));
      } else {
        return left(const MainFailure.otherFailure("Somthing went wrong"));
      }
    }
  }

  @override
  Future<Either<MainFailure, CheckedInModel>> updateCount(
      {required int count, required UpdateCountModel updateCountModel}) async {
    final data = {
      "user_id": updateCountModel.id,
      "transaction_id": updateCountModel.transactionId,
      "currentCount": count
    };
    try {
      final result = await Dio(BaseOptions()).post(
        '$baseUrl/mob_scan/checkin/',
        data: data,
      );
      if (result.statusCode == 200) {
        return right(CheckedInModel.fromJson(result.data));
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      if (e is DioException && e.response?.statusCode == 406) {
        return left(const MainFailure.otherFailure("Already checked in"));
      } else if (e is DioException && e.response?.statusCode == 400) {
        return left(const MainFailure.otherFailure("Invalid Transaction ID"));
      } else if (e is DioException && e.response?.statusCode == 500) {
        return left(
            const MainFailure.otherFailure("Server under maintainance"));
      } else {
        return left(const MainFailure.otherFailure("Somthing went wrong"));
      }
    }
  }
}
