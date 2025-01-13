import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/features/products/data/models/category_products_model.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productDetails});

  final ProductModel productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: ''),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CarouselView(
            itemSnapping: true,
            elevation: 0,
            itemExtent: MediaQuery.of(context).size.width - 32,
            children: productDetails.images
                .map((e) => CachedNetworkImage(
                      imageUrl: e,
                      placeholder: (context, url) =>
                          Lottie.asset('assets/images/Loading.json'),
                      fit: BoxFit.cover,
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: ListView(
                children: [
                  Text(
                    productDetails.name,
                    style: FontsStyles.bold22,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      StarRating(
                        rating: 4,
                        allowHalfRating: false,
                        color: AppColors.kPrimaryColor,
                        starCount: 5,
                        borderColor: AppColors.kPrimaryColor.withValues(alpha: 50),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '${productDetails.price} EGP ',
                          style:  FontsStyles.bold18.copyWith(
                            color: Colors.green,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: productDetails.price !=
                                      productDetails.oldPrice
                                  ? '${productDetails.oldPrice} EGP'
                                  : '',
                              style:  FontsStyles.regular16.copyWith(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add your cart functionality here
                        },
                        icon:  const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        tooltip: 'Add to cart',
                      ),
                    ],
                  ),
                  const Text(
                    'Description: ',
                    style: FontsStyles.bold16,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productDetails.description,
                    style: FontsStyles.regular16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
