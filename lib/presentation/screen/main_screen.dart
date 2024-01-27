// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/data/remote/model/song_model.dart';
import 'package:youtube_music_redesign/logic/navbar/nav_bar_bloc.dart';
import 'package:youtube_music_redesign/presentation/screen/explore_scree.dart';
import 'package:youtube_music_redesign/presentation/screen/home_screen.dart';
import 'package:youtube_music_redesign/presentation/screen/profile_screen.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';

List<SongModel> loadedList = [];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int navIndex = context.watch<NavBarBloc>().selectedIndex;
    print('page $navIndex');


    List _pages = [
      const HomeScreen(),
      const ExploreScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: _pages[navIndex],
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}