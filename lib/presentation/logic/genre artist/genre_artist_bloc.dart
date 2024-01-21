import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'genre_artist_event.dart';
part 'genre_artist_state.dart';

class GenreArtistBloc extends Bloc<GenreArtistEvent, GenreArtistState> {
  GenreArtistBloc() : super(GenreArtistInitial()) {
    on<UpdateGenreEvent>((event, emit) {
      emit(LoadingGenreArtist());
      try {
        bool isActive = event.isActive;
        int activeIndex = event.selectedIndex;
        emit(UpdatedGenreArtist(
            isActive: !isActive, selectedIndex: activeIndex));
      } catch (e) {
        emit(ErrorGenreArtist(errorMessage: '$e'));
      }
    });
    on<UpdateGenreEvent>((event, emit) {
      emit(LoadingGenreArtist());
      try {
        bool isActive = event.isActive;
        int activeIndex = event.selectedIndex;
        emit(UpdatedGenreArtist(
            isActive: !isActive, selectedIndex: activeIndex));
      } catch (e) {
        emit(ErrorGenreArtist(errorMessage: '$e'));
      }
    });
  }
}
