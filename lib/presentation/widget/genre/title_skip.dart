import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class TitleAndSkip extends StatelessWidget {
  const TitleAndSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select genres', style: textTheme.bodyMedium),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushReplacementNamed('homePage');
                },
                child: Text(
                  'Skip',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'This will help make recommendations\nmore accurate and interesting',
              style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
