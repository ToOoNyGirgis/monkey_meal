import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/features/menu/presentation/widgets/menu_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.centerLeft ,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: 100,
            decoration: const BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          const Column(
            children: [
              MenuCard(),
              SizedBox(height: 24),
              MenuCard(),
              SizedBox(height: 24),
              MenuCard(),
              SizedBox(height: 24),
              MenuCard(),
            ],
          ),
        ]
    );
  }
}
