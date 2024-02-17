import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/logic/borading_bloc/onlanding_bloc.dart';
import 'package:youtube_music_redesign/logic/genre%20artist/genre_artist_bloc.dart';
<<<<<<< HEAD
=======
import 'package:youtube_music_redesign/logic/navbar/nav_bloc.dart';
>>>>>>> ba4b119b8c2257710b15d28fbb0613b2a7d2aaf8
import 'package:youtube_music_redesign/utils/router/router_config.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingBloc()),
        BlocProvider(create: (context) => GenreArtistBloc()),
        BlocProvider(create: (context) => NavBloc()),
      ],
      child: MaterialApp.router(
        title: 'Youtube Music',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appColorBlack),
          scaffoldBackgroundColor: appColorBlack,
          useMaterial3: true,
          textTheme: TextTheme(
            titleLarge: titleLarge,
            bodyMedium: bodyMedium,
            bodySmall: bodySmall,
          ),
          fontFamily: 'Gilroy',
        ),
        routerConfig: AppRouterConfig.goRouter,
      ),
    );
  }
}
