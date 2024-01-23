import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_redesign/data/local/data_service.dart';
import 'package:youtube_music_redesign/data/remote/model/song_model.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';
import 'package:youtube_music_redesign/presentation/widget/home/mini_player.dart';
import 'package:youtube_music_redesign/presentation/widget/home/music_listview.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'secret.dart';

List<SongModel> loadedList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SongModel musicData;
  bool isPlaying = false;
  List<SongModel> dbMusicList = [];
  String backImg =
      'https://i.scdn.co/image/ab67616d0000b273af634982d9b15de3c77f7dd9';

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  Future<void> initializeData() async {
    await getSpotify(trackId: '4VnDmjYCZkyeqeb0NIKqdA');
    await initializeDatabase();
    _refreshNotes();
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> initializeDatabase() async {
    await SqliteService().initDB();
  }

  void _refreshNotes() async {
    final data = await SqliteService().getMusic();
    setState(() {
      dbMusicList = data;
    });
  }

  getSpotify({required String trackId}) async {
    final yt = YoutubeExplode();
    const clientId = SercetClassHere.clientId;
    const clientSecret = SercetClassHere.clientSerc;
    final credentials = SpotifyApiCredentials(clientId, clientSecret);
    final spotify = SpotifyApi(credentials);
    final responseData = await spotify.tracks.get(trackId);

    String? img = responseData.album!.images?[0].url;

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
      audioUrl: '$audioUrl',
    );

    checkAndAddMusic(loadedList, musicData, loadedList.add);
    checkAndAddMusic(dbMusicList, musicData, SqliteService().addMusic);

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

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;
    return Scaffold(
      body: Stack(
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
            top: width / 28,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {
                    setState(() {
                      isPlaying = false;
                    });
                    getSpotify(trackId: '4l8xoLKkJXhqqfbWdXcs93');
                    print(dbMusicList.length);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent.withOpacity(0.7),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          isPlaying && loadedList.isNotEmpty
              ? MiniPlayer(
                  songName: musicData.musicName,
                  artistName: musicData.artistName,
                  imgUrl: musicData.imgUrl,
                  audioUrl: musicData.audioUrl,
                  progress: 0.5)
              : const SizedBox(),
        ],
      ),
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}
