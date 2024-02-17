
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/logic/navbar/nav_bloc.dart';
import 'package:youtube_music_redesign/presentation/screen/explore_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/home_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/user_screen.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<NavBloc>().selectNavIndex;
    List _pages = [
      const HomeScreen(),
      const ExploreScreen(),
      const UserScreen(),
    ];
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}
