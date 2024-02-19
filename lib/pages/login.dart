import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // logo
          Center(
            child: Image.asset(
              'assets/swiiftlogo.png',
              width: 200.w,
              height: 200.h,
            ),
          ), // Added comma here

          // log in text
          Text(
            "Welcome back, you've been missed",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins-Bold',
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 25.h),

          // email
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          SizedBox(height: 10.h),

          // password
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 10.h),

          // forgot password
          Padding(
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
          SizedBox(
            height: 15.h,
          ),
          // sign in button
          MyButton(
            onTap: signUserIn, // Pass function reference without parentheses
          ),
          SizedBox(
            height: 50.h,
          ),

          // or you can continue with
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          )
        ],
      ),
    );
  }
}
