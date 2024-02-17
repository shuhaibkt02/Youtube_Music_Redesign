part of 'nav_bloc.dart';



 class LoadedNav extends Equatable {
  final int navIndex;

  const LoadedNav({required this.navIndex});
  
  @override
  List<Object?> get props => [navIndex];
}
