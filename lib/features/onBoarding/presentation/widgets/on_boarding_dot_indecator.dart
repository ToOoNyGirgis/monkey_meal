import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';

class OnboardingDotIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const OnboardingDotIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.kPrimaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
