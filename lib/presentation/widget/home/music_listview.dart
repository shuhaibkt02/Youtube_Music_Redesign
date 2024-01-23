import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.width,
    required this.textTheme,
    required this.title,
  });

  final double width;
  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 1.79,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Text(
              title,
              style: textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 5, bottom: 5),
                width: 135,
                decoration: BoxDecoration(
                  color: index.isEven ? appColorRed : appColorDarkGey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 1),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
