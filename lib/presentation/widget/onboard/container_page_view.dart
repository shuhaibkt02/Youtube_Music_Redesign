import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class PageViewContainer extends StatelessWidget {
  final String label;
  final VoidCallback onSkip;
  final String caption;
  final bool isLast;
  final bool isMiddle;
  const PageViewContainer({
    super.key,
    required this.isLast,
    required this.label,
    required this.isMiddle,
    required this.caption,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isLast ? appColorBlack : appColorRed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15, top: 30),
                alignment: Alignment.topRight,
                child: isLast
                    ? const SizedBox(height: 16)
                    : InkWell(
                        onTap: onSkip,
                        child: Text(
                          'Skip',
                          style: CustomTextTheme(context).bodySmall,
                        ),
                      ),
              ),
              Align(
                alignment: Alignment(
                    isLast
                        ? -1.4
                        : isMiddle
                            ? 3
                            : 1.6,
                    0),
                child: Text(
                  label,
                  textAlign: TextAlign.justify,
                  style: CustomTextTheme(context).titleLarge?.copyWith(
                        fontSize: CustomSize(context).width / 3.4,
                        letterSpacing: isLast
                            ? 1.9
                            : isMiddle
                                ? 0.5
                                : 2.9,
                      ),
                ),
              ),
            ],
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
