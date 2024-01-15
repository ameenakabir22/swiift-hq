import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swiift/pages/onboarding3.dart';

class Onboarding2 extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Text(
                'The Safety Of Your',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Goods Is Our Priority',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            // Add some spacing between text and animation
            SizedBox(height: 20),

            // Lottie animation
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Lottie.asset(
                'assets/delivery.json',
              ),
            ),

            // Text button
            TextButton(
              onPressed: () {
                // Add logic to handle the button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding3()),
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
          ],
        ),
      ),
    );
  }
}
