import 'package:flutter/material.dart';
import 'package:meal_monkey/features/products/presentation/widgets/product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductDetailsBody(),
    );
  }
}
