import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class MiniPlayer extends StatelessWidget {
  final String songName;
  final String artistName;
  final double progress;
  final String imgUrl;
  const MiniPlayer({
    super.key,
    required this.songName,
    required this.artistName,
    required this.progress,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF333330),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: NetworkImage(imgUrl),
                      ),
                    ),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songName,
                        style: textTheme.bodySmall,
                      ),
                      Flexible(
                        child: Text(
                          (artistName.length > 20)
                              ? artistName.split(' (Ft')[0].toString()
                              : artistName,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: textTheme.bodySmall?.copyWith(fontSize: 9.5),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: width / 3,
                        height: 2,
                        child: LinearProgressIndicator(
                          value: progress,
                          color: Colors.red.shade900,
                          backgroundColor: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.pause,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
