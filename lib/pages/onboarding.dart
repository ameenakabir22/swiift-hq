import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Connecting Reliable Delivery Partners To Your Doorsteps, Anytime, Anywhere',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
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
                onPressed: () {},
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF50E3C2), // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 70,
                  ), // Vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Border radius
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(0.0, -50.0),
              child: Text('Already have an account? Signup'))
        ],
      ),
    );
  }
}
