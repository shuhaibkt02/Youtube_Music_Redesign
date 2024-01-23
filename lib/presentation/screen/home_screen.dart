import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:youtube_music_redesign/data/remote/api/api_calling.dart';
import 'package:youtube_music_redesign/data/remote/model/song_model.dart';
import 'package:youtube_music_redesign/presentation/widget/home/cutom_navbar.dart';
import 'package:youtube_music_redesign/presentation/widget/home/mini_player.dart';
import 'package:youtube_music_redesign/presentation/widget/home/music_listview.dart';
import 'package:youtube_music_redesign/presentation/widget/home/top_area.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

List<SongModel> loadedList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SongModel data;
  bool isPlaying = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getSpotify() async {
    const apiKey = String.fromEnvironment('CLIENT_SECRET');

    // final credentials = SpotifyApiCredentials(clientId, clientSecret);
    // final spotify = SpotifyApi(credentials);
    // final artist = await spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');
    // print(artist);

    print(apiKey.runtimeType);
  }

  getData() async {
    final dio = ApiCall().dio;
    final response = await dio.get('/songs/1772342');
    data = SongModel.fromJson(response.data['response']['song']);
    if (!loadedList.any((element) => element.musicName == data.musicName)) {
      loadedList.add(data);
    }

    setState(() {
      isPlaying = true;
    });
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
                TopArea(textTheme: textTheme),
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
                    // getData();
                    getSpotify();
                    // print(loadedList.length);
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
                  songName: data.musicName,
                  artistName: data.artistName,
                  imgUrl: data.imgUrl,
                  progress: 0.5)
              : const SizedBox(),
        ],
      ),
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}
