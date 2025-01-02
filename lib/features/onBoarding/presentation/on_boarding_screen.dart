import 'package:flutter/material.dart';
import 'package:meal_monkey/features/onBoarding/presentation/widgets/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(child: OnBoardingScreenBody()),
    );
  }
}
