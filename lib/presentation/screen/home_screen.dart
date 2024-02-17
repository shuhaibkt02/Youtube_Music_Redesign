import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/home/music_listview.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // bool isPlaying = false;

    String backImg =
        'https://i.scdn.co/image/ab67616d0000b273af634982d9b15de3c77f7dd9';

    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;
    // SongModel music
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                TopArea(
                  textTheme: textTheme,
                  imgSrc: backImg,
                ),
                MusicCard(
                  width: width,
                  textTheme: textTheme,
                  title: 'New release',
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {},
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent.withOpacity(0.7),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          // if (isPlaying && loadedList.isNotEmpty)
          //   MiniPlayer(
          //       songName: musicData.musicName,
          //       artistName: musicData.artistName,
          //       imgUrl: musicData.imgUrl,
          //       audioUrl: musicData.audioUrl,
          //       progress: 0.5)
          // else
          //   const SizedBox(),
        ],
      ),
    );
  }
}