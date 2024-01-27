import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  int selectedIndex = 0;
  NavBarBloc() : super(InitialNavBar()) {
    on<SwitchNavBarEvent>((event, emit) {
      try {
        selectedIndex = event.selectedNavIndex;
        print(selectedIndex);
        emit(ChangedNavBar(navIndex: selectedIndex));
      } catch (e) {
        emit(ErrorNavBar(errorMessage: '$e'));
      }
    });
  }
}
