import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_monkey/core/services/api_service.dart';
import 'package:meal_monkey/features/auth/data/repos/auth_repo_impl.dart';
import 'package:meal_monkey/features/forget_password/data/repos/forget_password_repo_impl.dart';
import 'package:meal_monkey/features/menu/data/repos/menu_repo_impl.dart';
import 'package:meal_monkey/features/products/data/repos/product_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ForgetPasswordRepoImpl>(
    ForgetPasswordRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<MenuRepoImpl>(
    MenuRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
