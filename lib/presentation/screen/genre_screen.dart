// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/genre/grid_card.dart';
import 'package:youtube_music_redesign/presentation/widget/genre/title_skip.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/custom_button.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class GenreModel {
  final String label;
  final bool isActive;
  final Color selectedColor;
  final Color selectedInsideColor;

  GenreModel({
    required this.label,
    required this.isActive,
    required this.selectedColor,
    required this.selectedInsideColor,
  });
}

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<GenreModel> _genreModelList = [
      GenreModel(
        label: 'House',
        isActive: true,
        selectedColor: Colors.teal,
        selectedInsideColor: Colors.teal.shade200,
      ),
      GenreModel(
        label: 'Rock',
        isActive: false,
        selectedColor: Colors.amber,
        selectedInsideColor: Colors.amber.shade200,
      ),
      GenreModel(
        label: 'HipHop',
        isActive: true,
        selectedColor: Colors.red,
        selectedInsideColor: Colors.red.shade200,
      ),
      GenreModel(
        label: 'Trap',
        isActive: true,
        selectedColor: Colors.green,
        selectedInsideColor: Colors.green.shade200,
      ),
    ];

    final width = CustomSize(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFF1E1E1E),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFF1E1E1E),
                        child: const TitleAndSkip(),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1.5,
                          mainAxisSpacing: 2.9,
                          childAspectRatio: (width > 570)
                              ? 1.9
                              : (width > 372)
                                  ? 1.0
                                  : 0.86,
                        ),
                        itemCount: _genreModelList.length,
                        itemBuilder: (context, index) {
                          final genre = _genreModelList[index];
                          return GridCard(
                            isActive: genre.isActive,
                            label: genre.label,
                            selectedColor: genre.selectedColor,
                            selectedCircleColor: genre.selectedInsideColor,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onpress: () {},
              height: 60,
              backgroundColor: appColorRed,
              buttonLabel: 'Next',
              labelColor: appColorWhite,
            ),
          ],
        ),
      ),
    );
  }
}
