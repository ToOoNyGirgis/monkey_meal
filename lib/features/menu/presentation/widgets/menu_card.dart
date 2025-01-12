import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Food',
                    style: FontsStyles.bold22,
                  ),
                  Text(
                    '120 Items',
                    style: FontsStyles.regular11.copyWith(color: Colors.grey),
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
                  color: Colors.black.withValues(alpha: 0.2), // Shadow color
                  blurRadius: 10, // Spread of the shadow
                  offset: const Offset(0, 4), // Position of the shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
              child: const Icon(
                Icons.fastfood,
                size: 50,
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
    );
  }
}
