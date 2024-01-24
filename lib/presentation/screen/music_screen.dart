import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/music/footer_actions.dart';
import 'package:youtube_music_redesign/presentation/widget/music/music_controller.dart';
import 'package:youtube_music_redesign/presentation/widget/music/music_display.dart';
import 'package:youtube_music_redesign/presentation/widget/music/name_and_controller.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MusicDisplay(
              musicPoster:
                  'https://i.scdn.co/image/ab67616d0000b273af634982d9b15de3c77f7dd9',
              arrowDown: (dragDetails) {},
              moreOption: () {},
            ),
            const NameAndProgressBar(
              songName: 'Take My Breath Remix',
              artistName: 'The Weekend',
              progressTime: Duration(seconds: 10),
              totalTime: Duration(
                seconds: 80,
              ),
            ),
            MusicController(
              isShuffle: () {},
              backButton: () {},
              playButton: () {},
              forwordButton: () {},
              loopButton: () {},
            ),
            FooterActions(
              openQueue: () {},
              openLyrics: () {},
              shareContent: () {},
            ),
          ],
        ),
      ),
    );
  }
}
