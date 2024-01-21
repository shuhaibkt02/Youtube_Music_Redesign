import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLast,
    required this.onpress,
    required this.backgroundColor,
    required this.buttonLabel,
    required this.labelColor,
    this.height,
  });
  final VoidCallback onpress;
  final bool? isLast;
  final Color backgroundColor;
  final Color labelColor;
  final String buttonLabel;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: Size(CustomSize(context).width, height ?? 50),
        ),
        child: Text(buttonLabel,
            style: CustomTextTheme(context)
                .bodySmall
                ?.copyWith(color: labelColor)),
      ),
    );
  }
}
