
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/core/utils/api_service.dart';
import 'package:meal_monkey/core/utils/secure_local_network.dart';
import 'package:meal_monkey/features/auth/data/models/user_data/user_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo{

  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, UserModel>> registerUser(Map<String, dynamic> body) async {
    try {
      var data = await apiService.post(endPoint: 'register', data: body );
      var userModel = UserModel.fromJson(data);
      SecureLocalStorage.saveToken(key: 'token', value: userModel.data!.token??'');
      log(await SecureLocalStorage.getToken(key: 'token')??'');
      return right(userModel);
    }  catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, UserModel>> loginUser(Map<String, dynamic> body) async {
    try {
      var data = await apiService.post(endPoint: 'login', data: body );
      var userModel = UserModel.fromJson(data);
      SecureLocalStorage.saveToken(key: 'token', value: userModel.data!.token??'');
      log(await SecureLocalStorage.getToken(key: 'token')??'');
      return right(userModel);
    }  catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}

