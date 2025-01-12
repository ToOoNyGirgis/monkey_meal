import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/core/services/api_service.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:meal_monkey/features/products/data/repos/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoImpl({required this.apiService});

  @override
  Future<Either<Failure,CategoryProductModel>> getCategoryProducts(int id) async {
    try {
      final response = await apiService.get(endPoint: 'categories/$id');
      final categoryProductModel = CategoryProductModel.fromJson(response);
      return Right(categoryProductModel);
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