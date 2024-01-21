import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme(context).themeData;
    final width = CustomSize(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF272727),
                    radius: 22,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommentations',
                        style: textTheme.bodySmall,
                      ),
                      Text(
                        'Shu, we have prepared\nseveral mixes for you',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: width / 1.7,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 5),
                    width: 170,
                    decoration: BoxDecoration(
                      color: index.isEven ? appColorRed : appColorGrey,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 1),
                  itemCount: 5,
                ),
              ),
            ),
            MusicCard(
              width: width,
              textTheme: textTheme,
              title: 'Recommend',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF272727),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: appColorRed,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_4),
          ),
        ],
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.width,
    required this.textTheme,
    required this.title,
  });

  final double width;
  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 1.79,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Text(
              title,
              style: textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 5, bottom: 5),
                width: 135,
                decoration: BoxDecoration(
                  color: index.isEven ? appColorRed : appColorDarkGey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 1),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
