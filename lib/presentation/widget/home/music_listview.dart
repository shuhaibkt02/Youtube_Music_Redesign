import 'package:flutter/material.dart';
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
      height: width / 1.9,
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
                itemCount: 6,
                separatorBuilder: (context, index) => const SizedBox(width: 1),
                itemBuilder: (context, index) {
                  // final list = _platList[index];
                  return const PlayListCard();
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
  const PlayListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;

    return Container(
      margin: const EdgeInsets.only(left: 3, bottom: 5),
      width: width / 2.9,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bgm.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 5),
              child: InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 16,
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: const Color(0xFF272727).withOpacity(0.9),
                borderRadius: BorderRadius.circular(14)),
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  " music name",
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  " $width",
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

List<MixListModel> _platList = [
  MixListModel(
      subTitle: 'You mix',
      mixLabel: 'Youtube Mix',
      imgSrc: 'assets/images/you_mix.png'),
];
