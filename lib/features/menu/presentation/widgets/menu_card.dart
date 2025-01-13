import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/navigation/app_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/features/menu/data/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,  this.categoriesModel, required this.index,
  });
  final CategoriesModel? categoriesModel;
  final int index ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    context.push(AppRouter.kCategoryProductsScreen,extra: categoriesModel!.body.data[index]);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 59, right: 36),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 60, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      categoriesModel!.body.data[index].name,
                      style: FontsStyles.bold18,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,

                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: categoriesModel!.body.data[index].image,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                  placeholder: (context, url) =>   Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: Image(image: NetworkImage(categoriesModel!.body.data[index].image)),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red,size: 80,),
                ),
              ),

            ),
          ),
          Positioned(
            right: 15,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.kPrimaryColor,
              ),
              style:  ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                elevation: WidgetStateProperty.all(2),
                shadowColor: WidgetStateProperty.all(Colors.grey),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
