import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            padding: EdgeInsets.all(21.w),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Connecting Reliable Delivery Partners To Your Doorsteps, Anytime, Anywhere',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-10.0, -20.h),
            child: Image.asset(
              'assets/blackmotorcycle.png',
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
