import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int activeIndex;
  final int dotCount;
  const DotIndicator({
    super.key,
    required this.activeIndex,
    required this.dotCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        dotCount,
        (index) {
          bool isActive = activeIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 4,
              width: isActive ? 35 : 4,
              decoration: BoxDecoration(
                  color: isActive ? Colors.grey.shade300 : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(50)),
            ),
          );
        },
      ),
    );
  }
}
