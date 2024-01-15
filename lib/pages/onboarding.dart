import 'package:flutter/material.dart';
import 'package:swiift/pages/login.dart';
import 'package:swiift/pages/onboarding2.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/onboardingimg.jpeg'), context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Connecting Reliable Delivery Partners To Your Doorsteps, Anytime, Anywhere',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, -60.0),
            child: Image.asset(
              'assets/onboardingimg.jpeg',
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, -80.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: TextButton(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.of(context).push(_createRoute());
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF50E3C2), // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(
                    vertical: 23.0,
                    horizontal: 150,
                  ), // Vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Border radius
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, -20.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the login page when the "Log In" text is pressed
                Navigator.of(context).push(_createRoute2());
              },
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: Color(0xFF50E3C2), // Match the button color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Onboarding2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Slide from right to left
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LogIn(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // Start from bottom
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
