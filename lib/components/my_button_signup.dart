import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtonSignUp extends StatelessWidget {
  final Function()? onTap;

  const MyButtonSignUp({required this.onTap}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Added onTap handler to GestureDetector
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
