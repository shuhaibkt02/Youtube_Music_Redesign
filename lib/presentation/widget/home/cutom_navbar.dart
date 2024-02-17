import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/logic/navbar/nav_bloc.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_filled,
      Icons.search,
      Icons.person_outlined,
    ];
    return SafeArea(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1e1e).withOpacity(0.95),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(icons.length, (index) {
              return BlocBuilder<NavBloc, LoadedNav>(
                builder: (context, state) {
                  switch (state) {
                    case LoadedNav():
                      int navIndex = state.navIndex;
                      bool isActive = navIndex == index;
                      return Expanded(
                        child: _CutomNavButton(
                          icons: icons[index],
                          isActive: isActive,
                          onPress: () {
                            context
                                .read<NavBloc>()
                                .add(ChangeNavBarEvent(navIndex: index));
                          },
                        ),
                      );
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

class _CutomNavButton extends StatelessWidget {
  const _CutomNavButton({
    required this.icons,
    required this.isActive,
    required this.onPress,
  });

  final IconData icons;
  final bool isActive;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 50,
        child: Icon(
          icons,
          color: isActive ? appColorRed : appColorGrey,
        ),
      ),
    );
  }
}
