import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kipnews/app/config/routes/routes.dart';
import 'package:kipnews/app/features/onboarding/presentation/pages/onboarding_first_page.dart';
import 'package:kipnews/app/features/onboarding/presentation/pages/onboarding_second_page.dart';
import 'package:kipnews/app/features/onboarding/presentation/pages/onboarding_third_page.dart';
import 'package:kipnews/app/features/onboarding/presentation/widgets/button_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSkeleton extends StatefulWidget {
  const OnboardingSkeleton({super.key});

  @override
  State<OnboardingSkeleton> createState() => _OnboardingSkeletonState();
}

class _OnboardingSkeletonState extends State<OnboardingSkeleton> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardingFirstPage(),
              OnboardingSecondPage(),
              OnboardingThirdPage(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0),
              child: Column(
                // spacing: 40,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SmoothPageIndicator(
                  //   controller: _pageController,
                  //   count: 3,
                  //   effect: ExpandingDotsEffect(
                  //     dotColor: Color(0xFFA9B5DF),
                  //     activeDotColor: Color(0xFF575C89),
                  //   ),
                  //   onDotClicked: (index) {
                  //     _pageController.animateToPage(
                  //       index,
                  //       duration: Duration(milliseconds: 500),
                  //       curve: Curves.easeInOut,
                  //     );
                  //   },
                  // ),
                  SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_currentPage < 2)
                        ButtonWidget(
                          text: "Skip",
                          onPressed: () => context.go(Routes.login),
                          isOutlined: true,
                        ),
                      if (_currentPage < 2)
                        ButtonWidget(
                          text: "Next",
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      if (_currentPage == 2)
                        ButtonWidget(
                          text: "Get Started",
                          onPressed: () => context.go(Routes.register),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
