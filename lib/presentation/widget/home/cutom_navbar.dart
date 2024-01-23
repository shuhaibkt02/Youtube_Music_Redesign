import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    List<IconData> icons = [
      Icons.home_filled,
      Icons.explore_sharp,
      Icons.person_outlined,
    ];
    return SafeArea(
      child: Container(
        height: 65,
        margin: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: const Color(0xFF272727).withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(icons.length, (index) {
              bool isActive = selectedIndex == index;
              return IconButton(
                onPressed: () {},
                icon: Icon(
                  icons[index],
                  color: isActive ? appColorRed : appColorGrey,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
