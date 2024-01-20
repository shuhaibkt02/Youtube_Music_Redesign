// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_music_redesign/presentation/logic/borading_bloc/onlanding_bloc.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/onborad_page_view.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    List<String> _titleList = ["YouTu", "Tube M", "Music"];
    List<String> _captionList = [
      'Enjoy free access to millions\nof tracks from different\ngenres and artists',
      'Get recommendations based\non your preferences and\ndiscover new music',
      'Connect with your friends,\nshare playlists and discover\nnew tracks together',
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            switch (state) {
              case InitialOnBoarding():
                int selectedIndex = 0;

                bool isLastPage = selectedIndex == _titleList.length - 1;

                return OnboardingPageView(
                  pageController: _pageController,
                  titleList: _titleList,
                  captionList: _captionList,
                  isLastPage: isLastPage,
                  selectedIndex: selectedIndex,
                );
              case LoadingState():
                return const SizedBox();
              case OnboardingPageSelected():
                int stateIndex = state.selectedIndex;
                bool stateLast = stateIndex == _titleList.length - 1;
                return OnboardingPageView(
                  pageController: _pageController,
                  titleList: _titleList,
                  captionList: _captionList,
                  isLastPage: stateLast,
                  selectedIndex: stateIndex,
                );
              case ErrorStateOnBoarding():
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
