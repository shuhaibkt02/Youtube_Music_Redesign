import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/presentation/screen/artist_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/genre_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/home_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/music_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/on_boarding_page.dart';

class AppRouterConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/homePage',
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
        // builder: (context, state) => const GenreScreen(),
        pageBuilder: (context, state) => customTransitionPage<void>(
          state: state,
          child: const GenreScreen(),
          context: context,
        ),
      ),
      GoRoute(
        path: '/artistPage',
        name: 'artistPage',
        pageBuilder: (context, state) => customTransitionPage<void>(
          state: state,
          child: const ArtistScreen(),
          context: context,
        ),
      ),
      GoRoute(
        path: '/homePage',
        name: 'homePage',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
          path: '/musicPage',
          name: 'musicPage',
          // builder: (context, state) {
          //   final extraData = state.extra as Map<String, dynamic>;
          //   return MusicScreen(
          //     music: extraData['music'],
          //   );
          // },
          pageBuilder: (context, state) {
            final extraData = state.extra as Map<String, dynamic>;

            return customTransitionPage<void>(
              state: state,
              child: MusicScreen(
                music: extraData['music'],
              ),
              context: context,
            );
          }),
    ],
  );
}

CustomTransitionPage customTransitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
