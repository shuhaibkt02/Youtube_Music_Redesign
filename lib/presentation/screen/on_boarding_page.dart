// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/custom_button.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/custom_dot_indicator.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/page_view.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  int selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _titleList = ["YouTu", "Tube M", "Music"];
    List<String> _captionList = [
      'Enjoy free access to millions\nof tracks from different\ngenres and artists',
      'Get recommendations based\non your preferences and\ndiscover new music',
      'Connect with your friends,\nshare playlists and discover\nnew tracks together',
    ];
    PageController _pageController = PageController(initialPage: 0);
    bool isLastPage = selectedIndex == _titleList.length - 1;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                controller: _pageController,
                itemCount: _titleList.length,
                itemBuilder: (context, index) {
                  bool isLast = index == _titleList.length - 1;
                  return PageViewContainer(
                    label: _titleList[index],
                    caption: _captionList[index],
                    isLast: isLast,
                    isMiddle: index == _titleList.length - 2,
                  );
                },
              ),
              CustomButton(
                isLast: isLastPage,
                onpress: () async {
                  isLastPage
                      ? setState(() {
                          _pageController.jumpTo(0);
                        })
                      : setState(() {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        });
                },
              ),
              Positioned(
                bottom: CustomSize(context).width / 4.5,
                left: 25,
                child: DotIndicator(
                  activeIndex: selectedIndex,
                  dotCount: _titleList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
