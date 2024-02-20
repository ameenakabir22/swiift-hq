// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';
import 'package:swiift/components/square_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    // Implement sign in functionality here
    // For example:
    String email = emailController.text;
    String password = passwordController.text;

    // Perform sign in operation using email and password
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigate back to the previous page when the back arrow is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Transform.translate(
        offset: Offset(0.0, -40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //blob
            SvgPicture.asset(
              'assets/blob.svg',
              color: Colors.blue, // Change color as desired
            ),
            // logo
            Center(
              child: Image.asset(
                'assets/swiiftlogo.png',
                width: 200.w,
                height: 200.h,
              ),
            ), // Added comma here

            // log in text
            Transform.translate(
              offset: Offset(0.0, -50.h),
              child: Text(
                "Welcome back, you've been missed",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Bold',
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // email
            Transform.translate(
              offset: Offset(0.0, -50.h),
              child: MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
            ),
            const SizedBox(height: 10),

            // password
            Transform.translate(
              offset: Offset(0.0, -50.h),
              child: MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 10),

            // forgot password
            Transform.translate(
              offset: Offset(0.0, -50.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // sign in button
            Transform.translate(
              offset: Offset(0.0, -30.h),
              child: MyButton(
                onTap:
                    signUserIn, // Pass function reference without parentheses
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            // or you can continue with
            Transform.translate(
              offset: Offset(0.0, -20.h),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text('Or Continue with'),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            // google + apple sign in
            Transform.translate(
              offset: Offset(0.0, 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google icon

                  SquareTile(imagePath: 'assets/google.png'),

                  SizedBox(
                    width: 25,
                  ),
                  //apple icon
                  SquareTile(imagePath: 'assets/apple.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // Dont have an account ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
