import 'package:flutter/material.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/core/widgets/custom_search_bar.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:meal_monkey/features/products/presentation/widgets/product_grid_view.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({
    super.key,
    required this.categoryProductModel,
    required this.title,
  });

  final CategoryProductModel categoryProductModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomSearchBar(),
          const SizedBox(height: 20),
          ProductsGridView(categoryProductModel: categoryProductModel),
        ],
      ),
    );
  }
}




