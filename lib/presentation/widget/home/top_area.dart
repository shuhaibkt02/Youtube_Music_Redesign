import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class TopArea extends StatelessWidget {
  final TextTheme textTheme;
  final String imgSrc;
  const TopArea({
    super.key,
    required this.textTheme,
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    final width = CustomSize(context).width;
    final height = CustomSize(context).height;

    return Stack(
      children: [
        Image.network(
          imgSrc,
          colorBlendMode: BlendMode.hue,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 0.9),
          child: Column(
            children: [
              SizedBox(height: height / 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommentations',
                          style: textTheme.bodySmall,
                        ),
                        Text(
                          'Shu, we have prepared\nseveral mixes for you',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _MixListView(width: width),
            ],
          ),
        ),
      ],
    );
  }
}

class _MixListView extends StatelessWidget {
  final double width;

  const _MixListView({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: width / 1.8,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: _mixList.length,
          separatorBuilder: (context, index) => const SizedBox(width: 1),
          itemBuilder: (context, index) {
            final _mix = _mixList[index];
            return Container(
              margin: const EdgeInsets.only(left: 5, bottom: 5),
              width: width / 2.3,
              decoration: BoxDecoration(
                color: index.isEven ? appColorRed : appColorGrey,
                image: DecorationImage(
                  image: AssetImage(_mix.imgSrc),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _mix.subTitle,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _mix.mixLabel,
                      style: textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: width / 20,
                          child: const Icon(Icons.play_arrow),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MixListModel {
  final String subTitle;
  final String mixLabel;
  final String imgSrc;

  MixListModel(
      {required this.subTitle, required this.mixLabel, required this.imgSrc});
}

List<MixListModel> _mixList = [
  MixListModel(
      subTitle: 'Rock mix',
      mixLabel: 'Chill Mix',
      imgSrc: 'assets/images/rock.png'),
  MixListModel(
      subTitle: 'You mix',
      mixLabel: 'Youtube Mix',
      imgSrc: 'assets/images/bgm.png'),
  MixListModel(
      subTitle: 'Rock mix',
      mixLabel: 'Chill Mix',
      imgSrc: 'assets/images/rock.png'),
  MixListModel(
      subTitle: 'Pop mix',
      mixLabel: '2010s Mix',
      imgSrc: 'assets/images/lofi.png'),
  MixListModel(
      subTitle: 'Rock mix',
      mixLabel: 'Chill Mix',
      imgSrc: 'assets/images/rock.png'),
];
