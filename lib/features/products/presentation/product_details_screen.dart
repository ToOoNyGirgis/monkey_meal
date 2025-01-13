import 'package:flutter/material.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:meal_monkey/features/products/presentation/widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productDetails});

  final ProductModel productDetails;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(productDetails.name),
      ),
      body: ProductDetailsBody(
        productDetails: productDetails,
      ),
    );
  }
}
