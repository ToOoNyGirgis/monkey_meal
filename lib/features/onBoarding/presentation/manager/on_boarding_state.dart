part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {
  final int currentPage;
  final bool isLastPage;

  const OnBoardingState({
    this.currentPage = 0,
    this.isLastPage = false,
  });
}

final class OnBoardingInitial extends OnBoardingState {}
final class OnboardingPageChanged extends OnBoardingState {
  final int currentPage;
  final bool isLastPage;

  const OnboardingPageChanged({
    required this.currentPage,
    required this.isLastPage,
  }): super(currentPage: currentPage, isLastPage: isLastPage);
}
final class OnboardingCompleted extends OnBoardingState {}