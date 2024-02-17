import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:spotify/spotify.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_redesign/data/remote/model/song_model.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';
import 'package:youtube_music_redesign/presentation/widget/home/mini_player.dart';
import 'package:youtube_music_redesign/presentation/widget/home/music_listview.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
// import 'secret.dart';

List<SongModel> loadedList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SongModel musicData;
  bool isPlaying = false;
  String backImg =
      'https://i.scdn.co/image/ab67616d0000b273af634982d9b15de3c77f7dd9';

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  Future<void> initializeData() async {
    // await getSpotify(trackId: '7H0ya83CMmgFcOhw0UB6ow');
    setState(() {
      isPlaying = true;
    });
  }

  getSpotify({required String trackId}) async {
    final yt = YoutubeExplode();
    const clientId = 'SercetClassHere.clientId';
    const clientSecret = 'SercetClassHere.clientSerc';
    final credentials = SpotifyApiCredentials(clientId, clientSecret);
    final spotify = SpotifyApi(credentials);
    final responseData = await spotify.tracks.get(trackId);
    String? img = responseData.album!.images?[0].url;
    String? previewAudio = responseData.previewUrl;
    print(responseData.href);

    // youtube audio gen
    final result = await yt.search('${responseData.name}');
    final videoId = result.first.id.value;
    final manifest = await yt.videos.streamsClient.getManifest(videoId);
    final audioUrl = manifest.audioOnly.first.url;

    musicData = SongModel(
      id: 12,
      musicName: '${responseData.name}',
      releaseDate: '4',
      artistName: '${responseData.artists![0].name}',
      imgUrl: '$img',
      // audioUrl: '$audioUrl',
      audioUrl: (previewAudio != null) ? previewAudio : '$audioUrl',
      // totalDuration: result.first.duration!,
      totalDuration: (previewAudio != null)
          ? responseData.duration!
          : result.first.duration!,
    );

    checkAndAddMusic(loadedList, musicData, loadedList.add);

    setState(() {
      backImg = img!;
      isPlaying = true;
    });
  }

  void checkAndAddMusic(
      List<SongModel> dataList, SongModel musicData, Function addFunction) {
    if (!dataList.any((element) => element.musicName == musicData.musicName)) {
      addFunction(musicData);
    }
  }

=======
import 'package:youtube_music_redesign/presentation/widget/home/music_listview.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
>>>>>>> ba4b119b8c2257710b15d28fbb0613b2a7d2aaf8
  @override
  Widget build(BuildContext context) {
    // bool isPlaying = false;

    String backImg =
        'https://i.scdn.co/image/ab67616d0000b273af634982d9b15de3c77f7dd9';

    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;
    // SongModel music
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                TopArea(
                  textTheme: textTheme,
                  imgSrc: backImg,
                ),
                MusicCard(
                  width: width,
                  textTheme: textTheme,
                  title: 'New release',
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {},
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent.withOpacity(0.7),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          // if (isPlaying && loadedList.isNotEmpty)
          //   MiniPlayer(
          //       songName: musicData.musicName,
          //       artistName: musicData.artistName,
          //       imgUrl: musicData.imgUrl,
          //       audioUrl: musicData.audioUrl,
          //       progress: 0.5)
          // else
          //   const SizedBox(),
        ],
      ),
    );
  }
}