part of 'nav_bloc.dart';

sealed class NavEvent extends Equatable {
  const NavEvent();

  @override
  List<Object> get props => [];
}

final class ChangeNavBarEvent extends NavEvent {
  final int navIndex;

  const ChangeNavBarEvent({required this.navIndex});
}
