import 'package:flutter/material.dart';
import 'package:swiift/pages/onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Call _loadData to initiate the delayed loading and navigation
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate loading data
    await Future.delayed(Duration(seconds: 3));

    // Navigate to the next screen (e.g., Onboarding)
    Navigator.of(context).push(_createFadeRoute1());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.w,
          height: 200.h,
          child: Image.asset(
            'assets/swiiftlogo.png',
            height: 400,
            width: 400,
          ),
        ),
      ),
    );
  }
}

Route _createFadeRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Onboarding(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var fadeTween = Tween<double>(begin: 0.0, end: 1.0);
      var fadeAnimation = fadeTween.animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}
