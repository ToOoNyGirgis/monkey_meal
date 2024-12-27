
import 'package:dartz/dartz.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/features/auth/data/models/user_data/user_model.dart';

abstract class AuthRepo
{
  Future<Either<Failure,UserModel>> registerUser( Map<String , dynamic> body);
  Future<Either<Failure,UserModel>> loginUser( Map<String , dynamic> body);
  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<Either<Failure, UserModel>> signInWithFacebook();
  Future<Either<Failure, UserModel>> signInWithTwitter();
}
