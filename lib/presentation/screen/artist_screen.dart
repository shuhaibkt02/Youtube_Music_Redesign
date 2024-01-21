import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/genre/grid_card.dart';
import 'package:youtube_music_redesign/presentation/widget/genre/title_skip.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/custom_button.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class ArtistModel {
  final String label;
  final bool isActive;
  final String imgScr;

  ArtistModel({
    required this.label,
    required this.isActive,
    required this.imgScr,
  });
}

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<ArtistModel> _artistModelList = [
      ArtistModel(
        label: 'Post Malone',
        isActive: false,
        imgScr: 'assets/images/weekend.png',
      ),
      ArtistModel(
        label: 'David Guetta',
        isActive: false,
        imgScr: 'assets/images/weekend.png',
      ),
      ArtistModel(
        label: '2Pac',
        isActive: false,
        imgScr: 'assets/images/weekend.png',
      ),
      ArtistModel(
        label: 'Snoop Dogg',
        isActive: false,
        imgScr: 'assets/images/weekend.png',
      ),
      ArtistModel(
        label: 'The Weekend',
        isActive: true,
        imgScr: 'assets/images/weekend.png',
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
                        itemCount: _artistModelList.length,
                        itemBuilder: (context, index) {
                          final genre = _artistModelList[index];
                          return GridCard(
                            isActive: genre.isActive,
                            label: genre.label,
                            iconImg: genre.imgScr,
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
              buttonLabel: 'Start listening',
              labelColor: appColorWhite,
            ),
          ],
        ),
      ),
    );
  }
}
