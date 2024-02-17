import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, LoadedNav> {
  int selectNavIndex = 0;

  NavBloc() : super(const LoadedNav(navIndex: 0)) {
    on<ChangeNavBarEvent>((event, emit) {
      try {
        selectNavIndex = event.navIndex;
        emit(LoadedNav(navIndex: selectNavIndex));
      } catch (e) {
        if (kDebugMode) {
          print('$e');
        }
      }
    });
  }
}
