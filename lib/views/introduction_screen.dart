import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../routes/route_names.dart';
import 'utils/helper.dart';
import 'widgets/primary_button.dart';
import 'widgets/secondary_button.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  List<Map<String, dynamic>> pageList = [
    {
      'imageUrl': 'assets/images/img intro 1.png',
      'heading': 'The World at Your Fingertips',
      'body':
          'Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place',
    },
    {
      'imageUrl': 'assets/images/img intro 2.png',
      'heading': 'Tailored to Your Curiosity',
      'body':
          'Select your interests and receive handpicked stories. Technology, sports, or entertainment – we’ve got you covered',
    },
    {
      'imageUrl': 'assets/images/img intro 3.png',
      'heading': 'Trusted Updates in Real-Time',
      'body':
          'Instant alerts for breaking news, rigorously fact-checked by our editors before they reach you',
    },
  ];

  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 100),
                      Image.asset(pageList[index]['imageUrl'], height: 300),
                      SizedBox(height: 100),
                      Text(
                        pageList[index]['heading'],
                        style: headline3.copyWith(
                          color: cPrimary,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(pageList[index]['body'], style: subtitle1),
                      SizedBox(height: 12),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: pageList.length,
                        axisDirection: Axis.horizontal,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 3,
                          activeDotColor: cPrimary,
                          dotColor: cLinear,
                        ),
                      ),
                      Spacer(),
                      _currentPage == pageList.length - 1
                          ? PrimaryButton(
                            onPressed: () {
                              context.goNamed(RouteNames.login);
                            },
                            title: 'Get Started',
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: SecondaryButton(
                                  onPressed: () {
                                    //* Skip Introduction
                                    _pageController.jumpToPage(
                                      pageList.length - 1,
                                    );
                                  },
                                  title: 'Skip',
                                ),
                              ),
                              hsLarge,
                              Expanded(
                                child: PrimaryButton(
                                  onPressed: () {
                                    //* Go to Next Screen
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.ease,
                                    );
                                  },
                                  title: 'Next',
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
