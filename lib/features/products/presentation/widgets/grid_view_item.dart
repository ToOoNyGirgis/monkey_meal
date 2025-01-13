import 'package:flutter/material.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:meal_monkey/features/products/presentation/widgets/product_details.dart';
import 'package:meal_monkey/features/products/presentation/widgets/product_image.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.categoryProductModel,
  });

  final ProductModel categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductImage(categoryProductModel: categoryProductModel),
          ProductDetails(categoryProductModel: categoryProductModel),
        ],
      ),
    );
  }
}
