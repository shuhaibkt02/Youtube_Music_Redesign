import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int selectNavIndex = 0;

  NavBloc() : super(InitNav()) {
    on<ChangeNavBarEvent>((event, emit) {
      try {
        selectNavIndex = event.navIndex;
        emit(LoadedNav(navIndex: selectNavIndex));
      } catch (e) {
        emit(ErrorNav(errorMessage: '$e'));
      }
    });
  }
}
