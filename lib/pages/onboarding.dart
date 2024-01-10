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
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding2()),
                  );
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF50E3C2), // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(
                    vertical: 23.0,
                    horizontal: 120,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LogIn()), // Replace with your login page
                );
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
