import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swiift/pages/onboarding.dart';
import 'package:swiift/pages/onboarding2.dart';
import 'package:swiift/pages/onboarding3.dart';
import 'package:swiift/pages/signup_options.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller to keep track of which page we're on
  PageController _controller = PageController();

  // keep track of whether we are on the last page or not.
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [Onboarding(), Onboarding2(), Onboarding3()],
          ),

          // Dot indicators
          Transform.translate(
            offset: Offset(20.0, 585.0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.black,
                dotHeight: 6,
              ),
            ),
          ),

          // Positioned widget for UI elements
          Positioned(
            bottom: 30,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (onLastPage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpOptions()),
                  );
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
