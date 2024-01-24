import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/music/custom_icon.dart';

class MusicController extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback isShuffle;
  final VoidCallback backButton;
  final VoidCallback playButton;
  final VoidCallback pauseButton;
  final VoidCallback forwordButton;
  final VoidCallback loopButton;
  const MusicController({
    super.key,
    required this.isShuffle,
    required this.backButton,
    required this.playButton,
    required this.forwordButton,
    required this.loopButton,
    required this.pauseButton,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(
              onTap: isShuffle,
              icon: CupertinoIcons.shuffle,
            ),
          ),
          CustomIconButton(
            onTap: backButton,
            icon: Icons.skip_previous_rounded,
            iconColor: Colors.white,
            iconSize: 30,
          ),
          InkWell(
            onTap: isPlaying ? pauseButton : playButton,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(
                (isPlaying) ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          CustomIconButton(
            onTap: forwordButton,
            icon: Icons.skip_next_rounded,
            iconColor: Colors.white,
            iconSize: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(
              onTap: loopButton,
              icon: CupertinoIcons.repeat,
            ),
          ),
        ],
      ),
    );
  }
}
