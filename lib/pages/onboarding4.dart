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
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip button
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Material(
                      color: Colors.black, // Set background color to black
                      borderRadius: BorderRadius.circular(
                          50), // Set a large value for complete roundness
                      child: InkWell(
                        onTap: () {
                          // Add your onTap callback here
                        },
                        borderRadius: BorderRadius.circular(
                            50), // Set the same value for complete roundness
                        child: Container(
                          width: 100, // Set a fixed width for the button
                          height: 100, // Set a fixed height for the button
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your onTap callback here
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  Colors.black, // Set background color to black
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50), // Set a large value for complete roundness
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    )

                    // Next or Done button
                    /*onLastPage
                     ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpOptions();
                          }));
                        },
                        child: Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('Next'),
                      ), */
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
