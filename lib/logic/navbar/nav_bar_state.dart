part of 'nav_bar_bloc.dart';

sealed class NavBarState extends Equatable {
  const NavBarState();

  @override
  List<Object> get props => [];
}

final class InitialNavBar extends NavBarState {}
final class LoadingNavBar extends NavBarState {}

final class ChangedNavBar extends NavBarState {
  final int navIndex;

  const ChangedNavBar({required this.navIndex});
}

final class ErrorNavBar extends NavBarState {
  final String errorMessage;

  const ErrorNavBar({required this.errorMessage});
}
