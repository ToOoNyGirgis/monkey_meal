import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';
import 'package:shimmer/shimmer.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.categoryProductModel,
  });

  final ProductModel categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CachedNetworkImage(
        imageUrl: categoryProductModel.image,
        fit: BoxFit.contain,
        placeholder: (context, url) => Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child:Image(image: NetworkImage(categoryProductModel.image)),
          ), // Loading indicator
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.broken_image,
            color: Colors.grey,
            size: 40,
          ),
        ),
      ),
    );
  }
}
