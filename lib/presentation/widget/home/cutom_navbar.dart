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
          borderRadius: const BorderRadius.all(Radius.circular(14)),
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
                      return IconButton(
                        onPressed: () {
                          print('$index $navIndex');

                          context
                              .read<NavBloc>()
                              .add(ChangeNavBarEvent(navIndex: index));
                        },
                        icon: Icon(
                          icons[index],
                          color: isActive ? appColorRed : appColorGrey,
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
