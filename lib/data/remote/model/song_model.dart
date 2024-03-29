class SongModel {
  final int id;
  final String musicName;
  final String artistName;
  final String releaseDate;
  final Duration totalDuration;
  final String imgUrl;
  final String audioUrl;

  SongModel({
    required this.id,
    required this.musicName,
    required this.artistName,
    required this.releaseDate,
    required this.totalDuration,
    required this.imgUrl,
    required this.audioUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        musicName: json['title'] ?? 'no music',
        releaseDate: json['release_date'] ?? ' no data',
        artistName: json['artist_names'] ?? 'unknown',
        imgUrl: json['header_image_url'] ?? 'assets/images/bgm.png',
        audioUrl: json['apple_music_player_url'] ?? '',
        id: json['annotation_count'] ?? 0,
        totalDuration: const Duration(seconds: 30),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'musicName': musicName,
      'releaseDate': releaseDate,
      'artistName': artistName,
      'imgUrl': imgUrl,
      'audioUrl': audioUrl,
    };
  }
}
