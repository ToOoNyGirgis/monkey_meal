import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/features/home/presentation/widgets/menu_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // app bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu',
                    style: FontsStyles.regular25,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 22,
                      ))
                ],
              ),
            ),
            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding32),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Search food'),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            // categories card
            Stack(
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
            ),
          ],
        ),
      ),
    );
  }
}

