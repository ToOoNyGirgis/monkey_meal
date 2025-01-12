part of 'category_products_cubit.dart';

@immutable
sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}
final class CategoryProductsLoading extends CategoryProductsState {}
final class CategoryProductsSuccess extends CategoryProductsState {
  final CategoryProductModel categoryProductModel;

  CategoryProductsSuccess(this.categoryProductModel);
}
final class CategoryProductsFailure extends CategoryProductsState {
  final String errMsg;

  CategoryProductsFailure(this.errMsg);
}
