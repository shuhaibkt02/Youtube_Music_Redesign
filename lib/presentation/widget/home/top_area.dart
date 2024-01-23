import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class TopArea extends StatelessWidget {
  const TopArea({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final width = CustomSize(context).width;
    final height = CustomSize(context).height;

    return Stack(
      children: [
        Image.asset(
          'assets/images/weekend.png',
          colorBlendMode: BlendMode.hue,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.9),
          child: Column(
            children: [
              SizedBox(height: height / 4),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: width / 1.7,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(left: 5, bottom: 5),
                      width: 170,
                      decoration: BoxDecoration(
                        color: index.isEven ? appColorRed : appColorGrey,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 1),
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
