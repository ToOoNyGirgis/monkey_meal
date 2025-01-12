import 'package:dartz/dartz.dart';
import 'package:meal_monkey/core/errors/failures.dart';
import 'package:meal_monkey/features/menu/data/models/categories_model.dart';

abstract class MenuRepo {
  Future<Either<Failure, CategoriesModel>> getCategories();
}