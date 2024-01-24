import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/music/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final void Function(DragStartDetails) arrowDown;
  final VoidCallback moreOption;
  const CustomAppBar({super.key, required this.arrowDown, required this.moreOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(8, 0, 0, 0),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onVerticalDragStart: arrowDown,
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(150, 97, 97, 97),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          Text('Now Playing',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade200,
                  )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(150, 97, 97, 97),
              child: CustomIconButton(
                onTap: moreOption,
                icon: Icons.more_vert,
                iconColor: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
