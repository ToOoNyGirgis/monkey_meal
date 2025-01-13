import 'package:flutter/material.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:meal_monkey/features/products/presentation/widgets/grid_view_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.categoryProductModel,
  });

  final CategoryProductModel categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categoryProductModel.data.data.length,
        itemBuilder: (context, index) {
          return GridViewItem(categoryProductModel: categoryProductModel.data.data[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 16 / 21.5,
        ),
      ),
    );
  }
}
