import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isLast,
    required this.onpress,
  });
  final VoidCallback onpress;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: isLast ? appColorRed : appColorWhite,
          fixedSize: Size(CustomSize(context).width, 50),
        ),
        child: Text(isLast ? 'Get started' : 'Next',
            style: CustomTextTheme(context).bodySmall?.copyWith(
                color: isLast ? Colors.grey.shade300 : appColorBlack)),
      ),
    );
  }
}
