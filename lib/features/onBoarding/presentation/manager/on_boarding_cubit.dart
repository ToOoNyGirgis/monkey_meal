import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_assets.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/functions/shared_preferance.dart';
import 'package:meal_monkey/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnBoardingState> {
  OnboardingCubit() : super(OnBoardingInitial());
  bool get isLastPage => state.isLastPage;
  final PageController pageController = PageController();

  final List<OnboardingModel> pages = [
    const OnboardingModel(
      image: AppAssets.onBoarding1,
      title: 'Find food you love',
      description: 'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
    ),
    const OnboardingModel(
      image: AppAssets.onBoarding2,
      title: 'Fast Delivery',
      description: 'Fast food delivery to your home, office or wherever you are',
    ),
    const OnboardingModel(
      image: AppAssets.onBoarding3,
      title: 'Live Tracking',
      description: 'Real time tracking of your food on the app once you have placed your order',
    ),
  ];


  void onPageChanged(int page) {
    emit(OnboardingPageChanged(
      currentPage: page,
      isLastPage: page == pages.length - 1,
    ));
  }

  void nextPage() {
    final currentState = state;
    log('Current state: ${currentState.currentPage}');
    if (currentState.currentPage < pages.length - 1) {
      log('Navigating to next page');
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }else {
      log('Cannot navigate to next page');
    }
  }

  Future<void> completeOnboarding() async {
    await SharedPreferencesMethods.saveBool(
      key: AppConstants.onBoardingKey,
      value: true,
    );
    emit(OnboardingCompleted());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
