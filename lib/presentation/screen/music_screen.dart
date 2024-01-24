import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/music/custom_icon.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // _AppBar(),
            Container(
              color: Colors.red.shade700,
              child: _MusicDisplay(
                musicPoster:
                    // ignore: avoid_types_as_parameter_names
                    'https://i.scdn.co/image/ab67616d0000b273af634982d9b15de3c77f7dd9',
                arrowDown: (dragDetails) {
                  print(dragDetails.globalPosition.dx.toString());
                },
                moreOption: () {},
              ),
            ),
            const _NameAndProgressBar(
              songName: 'Take My Breath Remix',
              artistName: 'The Weekend',
              progressTime: Duration(seconds: 10),
              totalTime: Duration(
                seconds: 80,
              ),
            ),
            _MusicController(
              isShuffle: () {},
              backButton: () {},
              playButton: () {},
              forwordButton: () {},
              loopButton: () {},
            ),
            _FooterActions(
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

class _MusicDisplay extends StatelessWidget {
  final String musicPoster;
  final void Function(DragStartDetails) arrowDown;
  final void Function() moreOption;
  const _MusicDisplay(
      {required this.musicPoster,
      required this.arrowDown,
      required this.moreOption});

  @override
  Widget build(BuildContext context) {
    double width = CustomSize(context).width;
    bool isAsset = musicPoster.contains('asset');

    return Stack(
      children: [
        (isAsset)
            // ignore: dead_code
            ? Image.asset(
                musicPoster,
                fit: BoxFit.fill,
              )
            : Image.network(
                musicPoster,
                fit: BoxFit.fill,
              ),
        Column(
          children: [
            const SizedBox(height: 100),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.9),
              child: Center(
                child: Container(
                  height: width / 1.9,
                  width: width / 1.9,
                  decoration: BoxDecoration(
                    // color: Colors.red.shade800,
                    image: DecorationImage(
                      image: isAsset
                          ? AssetImage(musicPoster)
                          : NetworkImage(musicPoster) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
        _AppBar(
          arrowDown: arrowDown,
          moreOption: moreOption,
        ),

        // ),
      ],
    );
  }
}

class _FooterActions extends StatelessWidget {
  final VoidCallback openQueue;
  final VoidCallback openLyrics;
  final VoidCallback shareContent;
  const _FooterActions(
      {required this.openQueue,
      required this.openLyrics,
      required this.shareContent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconButton(
            onTap: openQueue,
            icon: Icons.format_line_spacing,
          ),
          CustomIconButton(
            onTap: openLyrics,
            icon: Icons.text_fields_outlined,
          ),
          CustomIconButton(
            onTap: shareContent,
            icon: CupertinoIcons.share,
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final void Function(DragStartDetails) arrowDown;
  final VoidCallback moreOption;
  const _AppBar({required this.arrowDown, required this.moreOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(8, 0, 0, 0),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onVerticalDragStart: arrowDown,
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(150, 97, 97, 97),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          Text('Now Playing',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade200,
                  )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(150, 97, 97, 97),
              child: CustomIconButton(
                onTap: moreOption,
                icon: Icons.more_vert,
                iconColor: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NameAndProgressBar extends StatelessWidget {
  final String songName;
  final String artistName;
  final Duration progressTime;
  final Duration totalTime;
  const _NameAndProgressBar(
      {required this.songName,
      required this.artistName,
      required this.progressTime,
      required this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(
            songName,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            artistName,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: ProgressBar(
              barHeight: 3,
              thumbRadius: 5,
              thumbGlowRadius: 10,
              thumbColor: Colors.white,
              baseBarColor: Colors.grey.shade600,
              progressBarColor: Colors.red.shade900,
              progress: progressTime,
              total: totalTime,
              timeLabelTextStyle: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MusicController extends StatelessWidget {
  final VoidCallback isShuffle;
  final VoidCallback backButton;
  final VoidCallback playButton;
  final VoidCallback forwordButton;
  final VoidCallback loopButton;
  const _MusicController({
    required this.isShuffle,
    required this.backButton,
    required this.playButton,
    required this.forwordButton,
    required this.loopButton,
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
              icon: CupertinoIcons.repeat,
            ),
          ),
          CustomIconButton(
            onTap: backButton,
            icon: Icons.skip_previous_rounded,
            iconColor: Colors.white,
            iconSize: 30,
          ),
          InkWell(
            onTap: playButton,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(
                Icons.pause,
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
