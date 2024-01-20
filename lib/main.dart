import 'package:flutter/material.dart';
import 'package:swiift/pages/splashscreen.dart';

void main() => runApp(Swiift());

class Swiift extends StatelessWidget {
  const Swiift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
