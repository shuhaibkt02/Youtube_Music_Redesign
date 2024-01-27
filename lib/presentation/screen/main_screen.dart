import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/screen/explore_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/home_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/user_screen.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List _pages = [
      const HomeScreen(),
      const ExploreScreen(),
      const UserScreen(),
    ];
    return Scaffold(
      body: _pages[0],
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}
