import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/presentation/screen/artist_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/genre_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/on_boarding_page.dart';

class AppRouterConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/genrePage',
    routes: [
      GoRoute(
        path: '/OnBoarding',
        name: 'OnBoarding',
        builder: (context, state) {
          return const OnBoardingPage();
        },
      ),
      GoRoute(
        path: '/genrePage',
        name: 'genrePage',
        builder: (context, state) {
          return const GenreScreen();
        },
      ),
      GoRoute(
        path: '/artistPage',
        name: 'artistPage',
        builder: (context, state) {
          return const ArtistScreen();
        },
      ),
    ],
  );
}
