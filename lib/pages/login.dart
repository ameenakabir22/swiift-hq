import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';
import 'package:swiift/components/square_tile.dart';
import 'package:swiift/pages/signup.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // back button
          Transform.translate(
            offset: Offset(-150.w, 10.h),
            child: IconButton(
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
          // logo
          Transform.translate(
            offset: Offset(0.0, -30.h),
            child: Center(
              child: Image.asset(
                'assets/swiiftlogo.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
          ), // Added comma here

          // log in text
          Transform.translate(
            offset: Offset(0.0, -60.h),
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
          SizedBox(height: 25.h),

          // email
          Transform.translate(
            offset: Offset(0.0, -70.h),
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
          ),
          SizedBox(height: 15.h),

          // password
          Transform.translate(
            offset: Offset(0.0, -70.h),
            child: MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
          ),
          SizedBox(height: 10.h),

          // forgot password
          Transform.translate(
            offset: Offset(0.0, -60.h),
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
          SizedBox(
            height: 10.h,
          ),
          // sign in button
          Transform.translate(
            offset: Offset(0.0, -50.h),
            child: MyButton(
              onTap: signUserIn, // Pass function reference without parentheses
            ),
          ),
          SizedBox(
            height: 50.h,
          ),

          // or you can continue with
          Transform.translate(
            offset: Offset(0.0, -50.h),
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
                  SizedBox(
                    width: 10.w,
                  ),
                  Text('Or Continue with'),
                  SizedBox(
                    width: 10.w,
                  ),
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
          SizedBox(
            height: 5.h,
          ),

          // google + apple sign in
          Transform.translate(
            offset: Offset(0.0, -15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // google icon
                SquareTile(imagePath: 'assets/google.png'),
                SizedBox(
                  width: 25,
                ),
                //apple icon
                SquareTile(
                  imagePath: 'assets/apple.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // Dont have an account ?
          GestureDetector(
            onTap: () {
              // Navigate to the sign up page when the "Sign up" text is pressed
              Navigator.of(context).push(_createRoute2());
            },
            child: RichText(
              text: TextSpan(
                text: "Don't have an account ? ",
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Colors.black, // Match the button color
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // Start from bottom
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
