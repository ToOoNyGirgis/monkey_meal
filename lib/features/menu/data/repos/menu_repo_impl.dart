import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/core/services/api_service.dart';
import 'package:meal_monkey/features/menu/data/models/categories_model.dart';
import 'package:meal_monkey/features/menu/data/repos/menu_repo.dart';

class MenuRepoImpl implements MenuRepo {
  final ApiService apiService;

  MenuRepoImpl({required this.apiService});


  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    try {
      var categories = await apiService.get(endPoint: 'categories');
      var categoriesModel = CategoriesModel.fromJson(categories);
      return Right(categoriesModel);
    } catch (e) {
      if(e is DioException) {
        log('server failure');
        return left(ServerFailure.fromDioErrors(e));
      }
      log('exception failure');
      return left(ServerFailure(e.toString()));
    }
  }
}