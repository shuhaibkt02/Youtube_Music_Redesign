import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';
import 'package:youtube_music_redesign/presentation/widget/home/music_listview.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                TopArea(textTheme: textTheme),
                MusicCard(
                  width: width,
                  textTheme: textTheme,
                  title: 'Picked for you',
                ),
                MusicCard(
                  width: width,
                  textTheme: textTheme,
                  title: 'Recently played',
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtomNavigation(),
          ),
          Positioned(
            top: 15,
            right: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: const Color(0xFF272727),
                radius: 20,
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
