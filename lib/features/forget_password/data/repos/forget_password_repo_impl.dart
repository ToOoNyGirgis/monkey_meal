import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/core/utils/api_service.dart';
import 'package:meal_monkey/features/forget_password/data/repos/forget_password_repo.dart';

class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  final ApiService apiService;

  ForgetPasswordRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, bool>> verifyEmail(String email) async {
    try {
      final result = await apiService.post(
        data: {
          'email': email,
        },
        endPoint: 'verify-email',
      );
      if (result['status'] != 'false') {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      if (e is DioException) {
        log('server failure');
        return left(ServerFailure.fromDioErrors(e));
      }
      log('exception failure');
      return left(ServerFailure(e.toString()));
    }
  }
}
