import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/features/onBoarding/data/models/on_boarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       SvgPicture.asset(model.image, height: 300),
        const SizedBox(height: 20),
        Text(
          model.title,
          style: FontsStyles.bold22,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            model.description,
            style: FontsStyles.regular16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}