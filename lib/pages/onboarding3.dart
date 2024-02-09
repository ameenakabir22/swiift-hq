import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swiift/pages/signup.dart';

class Onboarding3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Lottie.asset('assets/money.json'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 30, right: 30),
                child: Center(
                  child: Text(
                    'Own A Motorcycle?',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                child: Text(
                  'Join us! Turn your rides into earning opportunities with our delivery partner program. Your bike, your schedule, your earnings',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
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
