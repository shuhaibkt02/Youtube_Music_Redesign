import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLast,
    required this.onpress,
    this.child,
    this.backgroundColor,
  });
  final VoidCallback onpress;
  final bool? isLast;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLast == true) ? appColorRed : appColorWhite,
          fixedSize: Size(CustomSize(context).width, 50),
        ),
        child: child ??
            Text((isLast == true) ? 'Get started' : 'Next',
                style: CustomTextTheme(context).bodySmall?.copyWith(
                    color: (isLast == true)
                        ? Colors.grey.shade300
                        : appColorBlack)),
      ),
    );
  }
}
