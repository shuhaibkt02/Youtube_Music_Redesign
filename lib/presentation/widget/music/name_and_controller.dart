import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class NameAndProgressBar extends StatelessWidget {
  final String songName;
  final String artistName;
  final Duration progressTime;
  final Duration totalTime;
  const NameAndProgressBar(
      {super.key,
      required this.songName,
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
