import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swiift/pages/onboarding.dart';
import 'package:swiift/pages/onboarding2.dart';
import 'package:swiift/pages/onboarding3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            children: [Onboarding(), Onboarding2(), Onboarding3()],
          ),

          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip button
                GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text('Skip')),

                // dot indicators
                SmoothPageIndicator(controller: _controller, count: 3),

                // next button
                GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text('Next')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
