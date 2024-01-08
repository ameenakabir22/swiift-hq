import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigate back to the first page when the back arrow is pressed
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The Safety Of Your Goods Is Our Priority',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),

              //animations
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Lottie.asset(
                  'assets/delivery.json',
                ),
              ),

              //text button
              TextButton(onPressed: () {}, child: Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
