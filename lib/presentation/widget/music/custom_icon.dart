import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: iconColor ?? Colors.grey.shade600,
        size: iconSize ?? 18,
      ),
    );
  }
}
