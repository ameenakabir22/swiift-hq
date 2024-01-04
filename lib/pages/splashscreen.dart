import 'package:flutter/material.dart';
import 'package:swiift/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // delay fpr 3 secs, then navigate to signup screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: Center(
          child: Image.asset(
        'assets/swiiftlogo.png',
        height: 200,
        width: 200,
      )),
    ));
  }
}
