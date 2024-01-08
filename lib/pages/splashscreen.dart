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

    // Call _loadData to initiate the delayed loading and navigation
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate loading data
    await Future.delayed(Duration(seconds: 3));

    // Navigate to the next screen (e.g., Onboarding)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Onboarding()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/swiiftlogo.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
