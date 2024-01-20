import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/presentation/screen/on_boarding_page.dart';

class AppRouterConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/OnBoarding',
    routes: [
      GoRoute(
        path: '/OnBoarding',
        name: 'OnBoarding',
        builder: (context, state) {
          return const OnBoardingPage();
        },
      ),
    ],
  );
}
