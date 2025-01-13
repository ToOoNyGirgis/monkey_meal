import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.categoryProductModel,
  });

  final ProductModel categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryProductModel.name,
            style: FontsStyles.bold16.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ), // Adjusted for better visibility
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${categoryProductModel.price} EGP',
                  style: FontsStyles.regular16.copyWith(
                    color: Colors.green,
                    // Highlight price with a different color
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1, // Prevent overflow
                  overflow: TextOverflow
                      .ellipsis, // Truncate text if it overflows
                ),
              ),
              IconButton(
                onPressed: () {
                  // Add your cart functionality here
                },
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors
                      .blue, // Cart icon color for better visibility
                ),
                tooltip:
                'Add to cart', // Tooltip for accessibility
              ),
            ],
          )
        ],
      ),
    );
  }
}
