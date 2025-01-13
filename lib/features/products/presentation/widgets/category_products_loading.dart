import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/core/widgets/custom_search_bar.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductsLoadingBody extends StatelessWidget {
  const CategoryProductsLoadingBody({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomSearchBar(),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: 'categoryProductModel.data.data[index].image',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child:Image(image: NetworkImage('categoryProductModel.data.data[index].image')),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'name',
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
                                    'price EGP',
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
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 16 / 21.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
