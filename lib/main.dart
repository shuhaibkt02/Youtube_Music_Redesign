import 'package:flutter/material.dart';
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
    return MaterialApp.router(
      title: 'Youtube Music',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routerConfig: AppRouterConfig.goRouter,
    );
  }
}
