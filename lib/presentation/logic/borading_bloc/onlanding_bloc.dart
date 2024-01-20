import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onlanding_event.dart';
part 'onlanding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(InitialOnBoarding()) {
    on<OnBoardingEvent>((event, emit) {
    });
  }
}
