import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swiift/pages/signup.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigate back to the previous page when the back arrow is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [
        Text(
          'Do you Own A Motorcycle?',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
        Lottie.asset('assets/money.json'),
        Text(
          'Sign Up And Start Earning',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: () {
            // Add logic to handle the button press
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
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
      ]),
    );
  }
}
