part of 'nav_bloc.dart';

sealed class NavState extends Equatable {
  const NavState();
  
  @override
  List<Object> get props => [];
}


final class InitNav extends NavState {}

final class LoadedNav extends NavState {
  final int navIndex;

  const LoadedNav({required this.navIndex});
}

final class ErrorNav extends NavState {
  final String errorMessage;

  const ErrorNav({required this.errorMessage});
}
