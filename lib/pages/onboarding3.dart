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
      body: Center(
        child: Column(children: [
          Center(
            child: Text(
              'Do you Own A',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          Text('Motorcycle?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              )),
          SizedBox(height: 15),
          Lottie.asset('assets/money.json'),
          SizedBox(height: 20),
          Text(
            'Sign Up And Start',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              'Earning Now',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Add logic to handle the button press
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text('Get Started'),
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
        ]),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
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
