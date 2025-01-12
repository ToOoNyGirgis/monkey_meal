import 'package:bloc/bloc.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:meal_monkey/features/products/data/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.productRepo) : super(CategoryProductsInitial());
  final ProductRepo productRepo;

  void getCategoryProducts(int id) async {
    emit(CategoryProductsLoading());
    final result = await productRepo.getCategoryProducts(id);
    result.fold(
      (failure) => emit(CategoryProductsFailure(failure.errMessage)),
      (categoryProduct) => emit(CategoryProductsSuccess(categoryProduct)),
    );
  }

}
