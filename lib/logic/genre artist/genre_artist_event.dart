part of 'genre_artist_bloc.dart';

sealed class GenreArtistEvent extends Equatable {
  const GenreArtistEvent();

  @override
  List<Object> get props => [];
}

final class UpdateGenreEvent extends GenreArtistEvent {
  final bool isActive;
  final int selectedIndex;

  const UpdateGenreEvent({
    required this.isActive,
    required this.selectedIndex,
  });
}

final class UpdateArtistEvent extends GenreArtistEvent {
  final bool isActive;
  final int selectedIndex;

  const UpdateArtistEvent({required this.isActive, required this.selectedIndex});
}
