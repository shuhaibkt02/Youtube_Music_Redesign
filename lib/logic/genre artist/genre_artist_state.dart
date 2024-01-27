part of 'genre_artist_bloc.dart';

sealed class GenreArtistState extends Equatable {
  const GenreArtistState();

  @override
  List<Object> get props => [];
}

final class GenreArtistInitial extends GenreArtistState {}

final class LoadingGenreArtist extends GenreArtistState {}

final class UpdatedGenreArtist extends GenreArtistState {
  final bool isActive;
  final int selectedIndex;

  const UpdatedGenreArtist( {required this.isActive,required this.selectedIndex,
  });
}

final class ErrorGenreArtist extends GenreArtistState {
  final String errorMessage;

  const ErrorGenreArtist({required this.errorMessage});
}
