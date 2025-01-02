import 'package:dartz/dartz.dart';
import 'package:meal_monkey/core/errors/failures.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, bool>> verifyEmail(String email);
}