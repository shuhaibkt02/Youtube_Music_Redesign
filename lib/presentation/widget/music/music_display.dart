import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/music/app_bar.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class MusicDisplay extends StatelessWidget {
  final String musicPoster;
  final void Function(DragStartDetails) arrowDown;
  final void Function() moreOption;
  const MusicDisplay(
      {super.key, required this.musicPoster,
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
        CustomAppBar(
          arrowDown: arrowDown,
          moreOption: moreOption,
        ),

        // ),
      ],
    );
  }
}
