import 'package:flutter/material.dart';
import 'package:meal_monkey/features/home/presentation/widgets/categories_section.dart';
import 'package:meal_monkey/features/home/presentation/widgets/menu_app_bar.dart';
import 'package:meal_monkey/features/home/presentation/widgets/search_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MenuAppBar(),
            CustomSearchBar(),
            SizedBox(height: 40),
            CategoriesSection(),
          ],
        ),
      ),
    );
  }
}



