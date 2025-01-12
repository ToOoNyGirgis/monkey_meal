
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/navigation/app_router.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/features/onBoarding/presentation/manager/on_boarding_cubit.dart';
import 'package:meal_monkey/features/onBoarding/presentation/widgets/on_boarding_dot_indecator.dart';

import 'on_boarding_page.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnBoardingState>(
      builder: (context, state) {
        final viewModel = BlocProvider.of<OnboardingCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                itemCount: viewModel.pages.length,
                controller: viewModel.pageController,
                onPageChanged: viewModel.onPageChanged,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    model: viewModel.pages[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            OnboardingDotIndicator(
              currentPage: viewModel.state.currentPage,
              pageCount: viewModel.pages.length,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: CustomButton(
                text: viewModel.state.isLastPage ? 'Get Started' : 'Next',
                textStyle: FontsStyles.bold18.copyWith(color: Colors.white),
                buttonColor: AppColors.kPrimaryColor,
                onPressed: () async {
                  if (viewModel.isLastPage) {
                    await viewModel.completeOnboarding();
                    if (context.mounted) {
                      context.pushReplacement(AppRouter.kAuthScreen);
                    }
                  } else {
                    viewModel.nextPage();
                  }
                },
              ),
            ),
            const SizedBox(height: 40),

          ],
        );
      },
    );
  }
}
