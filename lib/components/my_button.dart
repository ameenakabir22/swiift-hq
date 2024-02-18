import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(60)),
        child: Center(
          child: Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
