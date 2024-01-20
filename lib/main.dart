import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/presentation/logic/borading_bloc/onlanding_bloc.dart';
import 'package:youtube_music_redesign/utils/router/router_config.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc(),
      child: MaterialApp.router(
        title: 'Youtube Music',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerConfig: AppRouterConfig.goRouter,
      ),
    );
  }
}
