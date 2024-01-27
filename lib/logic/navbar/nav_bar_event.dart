part of 'nav_bar_bloc.dart';

sealed class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

final class SwitchNavBarEvent extends NavBarEvent {
  final int selectedNavIndex;

  const SwitchNavBarEvent({required this.selectedNavIndex});
}
