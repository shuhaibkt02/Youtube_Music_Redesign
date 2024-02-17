import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/presentation/screen/home_screen.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

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
      height: width / 1.7,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: loadedList.length,
                separatorBuilder: (context, index) => const SizedBox(width: 1),
                itemBuilder: (context, index) {
                  final list = loadedList[index];
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed('musicPage', extra: {'music': list});
                    },
                    child: PlayListCard(
                      musicName: list.musicName,
                      artistName: list.artistName,
                      musicPoster: list.imgUrl,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayListCard extends StatelessWidget {
  final String musicName;
  final String artistName;
  final String musicPoster;
  const PlayListCard({
    super.key,
    required this.musicName,
    required this.artistName,
    required this.musicPoster,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;
    bool isAsset = musicPoster.contains('asset');

    return Container(
      margin: const EdgeInsets.only(left: 3, bottom: 5),
      width: width / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isAsset
              ? AssetImage(musicPoster)
              : CachedNetworkImageProvider(musicPoster) as ImageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF272727).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  musicName,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  artistName,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

