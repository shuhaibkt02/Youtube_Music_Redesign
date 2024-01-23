import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/data/local/data_service.dart';
import 'package:youtube_music_redesign/presentation/logic/borading_bloc/onlanding_bloc.dart';
import 'package:youtube_music_redesign/presentation/logic/genre%20artist/genre_artist_bloc.dart';
import 'package:youtube_music_redesign/utils/router/router_config.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqliteService().initDB();
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
      ],
      child: MaterialApp.router(
        title: 'Youtube Music',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerConfig: AppRouterConfig.goRouter,
      ),
    );
  }
}
