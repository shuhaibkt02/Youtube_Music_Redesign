part of 'onlanding_bloc.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class InitialOnBoarding extends OnBoardingState {}

final class LoadingState extends OnBoardingState {}

final class OnboardingPageSelected extends OnBoardingState {
  final int selectedIndex;

  const OnboardingPageSelected({required this.selectedIndex});
}

final class ErrorStateOnBoarding extends OnBoardingState {
  final String errorMessage;

  const ErrorStateOnBoarding({required this.errorMessage});
}
