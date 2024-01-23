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
    bool isPlaying = true;
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
                  title: 'New release',
                ),
              ],
            ),
          ),
          // ignore: dead_code
          isPlaying ? const MiniPlayer() : const SizedBox(),
          // Positioned(
          //   top: 5,
          //   right: 5,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Icon(
          //       Icons.settings_outlined,
          //       color: Colors.grey.shade400,
          //       size: 20,
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF333330),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Music name',
                        style: textTheme.bodySmall,
                      ),
                      Text(
                        'Music name',
                        style: textTheme.bodySmall?.copyWith(fontSize: 10),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: width / 3,
                        height: 2,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          color: Colors.red.shade900,
                          backgroundColor: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.pause,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
