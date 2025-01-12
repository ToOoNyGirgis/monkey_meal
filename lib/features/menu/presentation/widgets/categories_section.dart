import 'package:flutter/material.dart';
import 'package:meal_monkey/features/menu/data/models/categories_model.dart';
import 'package:meal_monkey/features/menu/presentation/widgets/menu_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,  required this.categoriesModel,
  });
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) => CategoryCard(
          categoriesModel: categoriesModel,
          index: index,
        ),

      ),
    );
  }
}
