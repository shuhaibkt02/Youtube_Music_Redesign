import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/music/custom_icon.dart';

class MusicPlayerParts{
  
}

class FooterActions extends StatelessWidget {
  final VoidCallback openQueue;
  final VoidCallback openLyrics;
  final VoidCallback shareContent;
  const FooterActions(
      {super.key, required this.openQueue,
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
