import 'package:flutter/material.dart';
import 'package:meal_monkey/features/menu/presentation/widgets/categories_section.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/core/widgets/custom_search_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Menu',),
            CustomSearchBar(),
            SizedBox(height: 40),
            CategoriesSection(),
          ],
        ),
      ),
    );
  }
}



