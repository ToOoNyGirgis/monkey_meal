import 'package:dartz/dartz.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';

abstract class ProductRepo {
  Future<Either<Failure,CategoryProductModel>> getCategoryProducts(int id);
}