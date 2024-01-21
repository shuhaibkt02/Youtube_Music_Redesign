import 'package:flutter/material.dart';
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
        builder: (context, state) => const GenreScreen(),
        //  pageBuilder: (context, state) => customTransitionPage<void>(
        //     child: const GenreScreen(),
        //     context: context,
        //   ),
      ),
      GoRoute(
        path: '/artistPage',
        name: 'artistPage',
        pageBuilder: (context, state) => customTransitionPage<void>(
          child: const ArtistScreen(),
          context: context,
        ),
      ),
    ],
  );
}

CustomTransitionPage customTransitionPage<T>({
  required BuildContext context,
  GoRouterState? state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state?.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
