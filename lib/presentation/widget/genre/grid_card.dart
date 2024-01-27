import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class GridCard extends StatelessWidget {
  final bool isActive;
  final String? label;
  final String? iconImg;
  final Color? selectedColor;
  final Color? selectedCircleColor;
  final VoidCallback? onTap;
  const GridCard({
    super.key,
    required this.isActive,
    this.label,
    this.iconImg,
    this.selectedColor,
    this.selectedCircleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = CustomSize(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 3),
        decoration: BoxDecoration(
          color:
              isActive ? selectedColor ?? Colors.red.shade400 : colorDarkGrey2,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: (width > 570)
                  ? width / 16
                  : (width > 549)
                      ? width / 14
                      : width / 11,
              backgroundColor: isActive ? selectedCircleColor : colorDarkGrey3,
              backgroundImage:
                  AssetImage(iconImg ?? 'assets/images/google.png'),
            ),
            const SizedBox(height: 5),
            Text(
              label ?? 'Art',
              style: CustomTextTheme(context).bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
