import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onlanding_event.dart';
part 'onlanding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(InitialOnBoarding()) {
    on<CheckBoardingPage>((event, emit) {
      emit(LoadingState());
      try {
        emit(OnboardingPageSelected(selectedIndex: event.selectedIndex));
      } catch (e) {
        emit(ErrorStateOnBoarding(errorMessage: '$e'));
      }
    });
  }
}
