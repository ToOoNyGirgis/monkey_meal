import 'package:bloc/bloc.dart';
import 'package:meal_monkey/features/menu/data/models/categories_model.dart';
import 'package:meal_monkey/features/menu/data/repos/menu_repo.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.menuRepo) : super(CategoriesInitial());
  final MenuRepo menuRepo;
  void getCategories() async {
    emit(CategoriesLoading());
      var categories = await menuRepo.getCategories();
      categories.fold(
            (failure) => emit(
          CategoriesFailure(failure.errMessage),
        ),
            (categories) => emit(
          CategoriesSuccess(categories),
        ),
      );
  }
}
