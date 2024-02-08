import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swiift/pages/onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Lottie.asset(
                'assets/delivery.json',
              ),
            ),
            // Use Padding widget individually for each text
            Transform.translate(
              offset: Offset(0.0, -50),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: Text(
                      'The Safety Of Your',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Goods Is Our Priority',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                    child: Text(
                      'Your goods, our priority. Experience deliveries with a safety-first approach because your peace of mind matters',
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade800),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            // Add some spacing between text and animation
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Onboarding3(),
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
