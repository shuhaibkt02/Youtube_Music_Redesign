part of 'onlanding_bloc.dart';

sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}


final class CheckBoardingPage extends OnBoardingEvent{}