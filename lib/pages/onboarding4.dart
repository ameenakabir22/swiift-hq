import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            children: [
              Onboarding(),
              Onboarding2(),
              Onboarding3(),
            ],
          ),

          // Dot indicators
          Positioned(
            left: 20.w,
            bottom: 45.h,
            child: Container(
              width: 300, // Adjust width as needed
              height: 20, // Adjust height as needed
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.black,
                  dotHeight: 6,
                ),
              ),
            ),
          ),
          // positioned widget for the skip text button
          Positioned(
            top: 20.h,
            right: 20.w,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpOptions()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          // Positioned widget for the material button
          Positioned(
            bottom: 30.h,
            right: 20.w,
            child: Material(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.black,
              child: InkWell(
                borderRadius: BorderRadius.circular(30.r),
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
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 25.sp,
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
