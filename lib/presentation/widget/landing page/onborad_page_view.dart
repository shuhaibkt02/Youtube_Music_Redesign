import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_music_redesign/presentation/logic/borading_bloc/onlanding_bloc.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/custom_button.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/custom_dot_indicator.dart';
import 'package:youtube_music_redesign/presentation/widget/landing%20page/container_page_view.dart';
import 'package:youtube_music_redesign/utils/extension/custom_size.dart';
import 'package:youtube_music_redesign/utils/theme/app_text_theme.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required PageController pageController,
    required List<String> titleList,
    required List<String> captionList,
    required this.isLastPage,
    required this.selectedIndex,
  })  : _pageController = pageController,
        _titleList = titleList,
        _captionList = captionList;

  final PageController _pageController;
  final List<String> _titleList;
  final List<String> _captionList;
  final bool isLastPage;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final double width = CustomSize(context).width;
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (index) {
            context
                .read<OnBoardingBloc>()
                .add(CheckBoardingPage(selectedIndex: index));
          },
          controller: _pageController,
          itemCount: _titleList.length,
          itemBuilder: (context, index) {
            bool isLast = index == _titleList.length - 1;
            return PageViewContainer(
              label: _titleList[index],
              onSkip: () {
                _pageController.jumpToPage(_titleList.length - 1);
              },
              caption: _captionList[index],
              isLast: isLast,
              isMiddle: index == _titleList.length - 2,
            );
          },
        ),
        Positioned(
          bottom: (width < 365)
              ? width / 3
              : (width > 376)
                  ? width / 4.2
                  : width / 3.2,
          left: 25,
          child: SizedBox(
            width: CustomSize(context).width,
            child: Text(_captionList[selectedIndex],
                textAlign: TextAlign.start,
                style: CustomTextTheme(context).bodyMedium),
          ),
        ),
        CustomButton(
          backgroundColor: (isLastPage == true) ? appColorRed : appColorWhite,
          buttonLabel: (isLastPage == true) ? 'Get started' : 'Next',
          labelColor:
              (isLastPage == true) ? Colors.grey.shade300 : appColorBlack,
          isLast: isLastPage,
          onpress: () async {
            isLastPage
                ? bottomSheet(
                    context: context,
                  )
                : _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
          },
        ),
        Positioned(
          bottom: (width < 365)
              ? width / 4
              : (width > 376)
                  ? width / 5.3
                  : width / 4.3,
          left: 25,
          child: DotIndicator(
            activeIndex: selectedIndex,
            dotCount: _titleList.length,
          ),
        ),
      ],
    );
  }

  bottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: Color(0xff1E1E1E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        height: CustomSize(context).width / 2.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).pushReplacementNamed('genrePage');
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff424242),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xff343434),
                        child: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Login with Google',
                        style: CustomTextTheme(context)
                            .bodySmall
                            ?.copyWith(color: const Color(0xffA7A7A7)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xff747474),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: CustomTextTheme(context)
                      .bodySmall
                      ?.copyWith(color: appColorGrey),
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(
                    ' Register',
                    style: CustomTextTheme(context)
                        .bodySmall
                        ?.copyWith(color: appColorRed),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
