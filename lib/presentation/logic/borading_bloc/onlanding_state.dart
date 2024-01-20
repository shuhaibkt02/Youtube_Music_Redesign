part of 'onlanding_bloc.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();
  
  @override
  List<Object> get props => [];
}

final class InitialOnBoarding extends OnBoardingState {}
