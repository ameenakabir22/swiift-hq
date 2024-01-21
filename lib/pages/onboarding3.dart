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
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Center(
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
          ]),
        ),
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
