import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/data/remote/model/song_model.dart';
import 'package:youtube_music_redesign/presentation/widget/music/footer_actions.dart';
import 'package:youtube_music_redesign/presentation/widget/music/music_controller.dart';
import 'package:youtube_music_redesign/presentation/widget/music/music_display.dart';
import 'package:youtube_music_redesign/presentation/widget/music/name_and_controller.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class MusicScreen extends StatefulWidget {
  final SongModel music;
  const MusicScreen({super.key, required this.music});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final player = AudioPlayer();
  final AudioCache playerCache = AudioCache();
  bool lyricsOpen = false;
  ScrollController _scrollController = ScrollController();
  GlobalKey _lyricsContainerKey = GlobalKey();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String status = player.state.name;
    bool isPlaying = (status == 'playing') ? true : false;
    double width = CustomSize(context).width;
    double height = CustomSize(context).height;
    final theme = CustomTextTheme(context).themeData;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MusicDisplay(
                lyricsOpen: lyricsOpen,
                musicPoster: widget.music.imgUrl,
                arrowDown: (dragDetails) async {
                  context.pop();
                  await player.stop();
                },
                moreOption: () {},
              ),
              const SizedBox(height: 30),
              NameAndProgressBar(
                songName: widget.music.musicName,
                artistName: widget.music.artistName,
                totalTime: widget.music.totalDuration,
                position: player.onPositionChanged,
                onSeek: (pointer) {
                  player.seek(pointer);
                },
              ),
              const SizedBox(height: 20),
              MusicController(
                isPlaying: isPlaying,
                isShuffle: () {},
                backButton: () {},
                pauseButton: () async {
                  await player.pause();
                  setState(() {
                    status = player.state.name;
                  });
                },
                playButton: () async {
                  await player.play(UrlSource(widget.music.audioUrl));

                  player.onPlayerComplete.listen((event) {
                    setState(() {
                      status = player.state.name;
                    });
                  });
                  setState(() {
                    status = player.state.name;
                  });
                },
                forwordButton: () {},
                loopButton: () {},
              ),
              const SizedBox(height: 40),
              FooterActions(
                openQueue: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return QuereContainer(
                        song: widget.music,
                        width: width,
                        height: height,
                        theme: theme,
                      );
                    },
                  );
                },
                openLyrics: () {
                  setState(() {
                    lyricsOpen = !lyricsOpen;
                  });
                  if (lyricsOpen) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      final render = _lyricsContainerKey.currentContext!
                          .findRenderObject() as RenderBox;
                      final position = render.localToGlobal(Offset.zero);
                      print(position);

                      _scrollController.animateTo(
                        position.dy,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  }
                },
                shareContent: () {},
              ),
              if (lyricsOpen)
                Container(
                  key: _lyricsContainerKey,
                  height: width - 55,
                  width: width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\nHas lately been swaying\nAnd I don\'t know if you\'re looking for Somebody better or something more Cause even when you\'re with meYour eyes are still straying',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuereContainer extends StatelessWidget {
  const QuereContainer({
    super.key,
    required this.width,
    required this.height,
    required this.theme,
    required this.song,
  });

  final double width;
  final double height;
  final TextTheme theme;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 1.2,
      decoration: const BoxDecoration(
          color: appColorBlack,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Text(
                'Now PLaying',
                textAlign: TextAlign.start,
                style: theme.bodySmall?.copyWith(color: Colors.grey.shade500),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              // height: 60,
              width: width,
              decoration: BoxDecoration(
                color: const Color(0xFF363636),
                borderRadius: BorderRadius.circular(14),
              ),
              child: MusicTile(
                  theme: theme,
                  image: song.imgUrl,
                  songLabel: song.musicName,
                  artist: song.artistName,
                  isAdded: true),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Text(
                'Next',
                textAlign: TextAlign.start,
                style: theme.bodySmall?.copyWith(color: Colors.grey.shade500),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1e1e1e),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14))),
                child: ListView.separated(
                    itemBuilder: (context, index) => MusicTile(
                          image: 'assets/images/bgm.png',
                          theme: theme,
                          songLabel: 'music $index',
                          artist: 'artist $index',
                          isAdded: index.isEven,
                        ),
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemCount: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicTile extends StatelessWidget {
  final TextTheme theme;
  final String songLabel;
  final String artist;
  final bool isAdded;
  final String image;

  const MusicTile({
    super.key,
    required this.theme,
    required this.songLabel,
    required this.artist,
    required this.isAdded,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    bool isAsset = image.contains('asset');

    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: isAsset
                ? AssetImage(image)
                : CachedNetworkImageProvider(image) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        songLabel,
        style: theme.bodySmall,
      ),
      subtitle: Text(
        artist,
        style: theme.bodySmall?.copyWith(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAdded ? Icons.done : Icons.add,
            color: isAdded ? Colors.red : Colors.grey.shade500,
          ),
          const SizedBox(width: 15),
          Icon(
            Icons.more_horiz,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
