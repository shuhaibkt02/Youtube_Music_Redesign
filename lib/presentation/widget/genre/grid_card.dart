import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class GridCard extends StatelessWidget {
  final bool isActive;
  final String? label;
  final String? iconImg;
  final Color? selectedColor;
  final Color? selectedCircleColor;
  const GridCard({
    super.key,
    required this.isActive,
    this.label,
    this.iconImg,
    this.selectedColor,
    this.selectedCircleColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = CustomSize(context).width;
    return Container(
      margin: const EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
        color: isActive
            ? selectedColor ?? Colors.red.shade400
            : const Color(0xFF272727),
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
            backgroundColor:
                isActive ? selectedCircleColor : const Color(0xFF323232),
            backgroundImage: AssetImage(iconImg ?? 'assets/images/google.png'),
          ),
          const SizedBox(height: 5),
          Text(
            label ?? 'Art',
            style: CustomTextTheme(context).bodySmall,
          )
        ],
      ),
    );
  }
}
