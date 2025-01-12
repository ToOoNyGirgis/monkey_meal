import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/features/menu/data/models/categories_model.dart';
import 'package:meal_monkey/features/products/manager/category_products_cubit/category_products_cubit.dart';
import 'package:meal_monkey/features/products/presentation/widgets/category_products_body.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.category});

  final CategoriesData category;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductsCubit>(context).getCategoryProducts(
        widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryProductsFailure) {
            return Center(
              child: Text(state.errMsg),
            );
          }
          else if(state is CategoryProductsSuccess) {
            return CategoryProductsBody(
              title: widget.category.name,
              categoryProductModel: state.categoryProductModel,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
