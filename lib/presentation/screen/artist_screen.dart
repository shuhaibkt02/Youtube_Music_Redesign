import 'package:flutter/material.dart';

class GenreModel {
  final String label;
  final bool isActive;
  final String imgScr;

  GenreModel({
    required this.label,
    required this.isActive,
    required this.imgScr,
  });
}

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
