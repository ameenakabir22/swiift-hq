import 'package:flutter/material.dart';
import 'package:swiift/pages/onboarding4.dart';
import 'package:swiift/pages/splashscreen.dart';
import 'package:swiift/responsive/mobile_body.dart';
import 'package:swiift/responsive/responsive_layout.dart';
import 'package:swiift/responsive/tablet_body.dart';

void main() => runApp(Swiift());

class Swiift extends StatelessWidget {
  const Swiift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(
          mobileBody: const MyMobileBody(), tabletBody: const MyTabletBody()),
      debugShowCheckedModeBanner: false,
    );
  }
}
