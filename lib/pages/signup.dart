import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button_signup.dart';
import 'package:swiift/components/square_tile.dart';
import 'package:swiift/pages/login.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void signUpUser() {
    // Implement sign-up functionality here
    // For example:
    String fullName = fullNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String phoneNumber = phoneController.text;

    // Perform sign-up operation using provided details
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back button
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: Align(
              alignment: Alignment.topLeft,
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
          ),
          // Logo
          Transform.translate(
            offset: Offset(0.0, -100.h),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Image.asset(
                'assets/swiiftlogo.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
          ),
          // Sign up text
          Transform.translate(
            offset: Offset(0.0, -120.h),
            child: Text(
              "Create your Account",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Bold',
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 25.h),
          // Full name field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: MyTextField(
              controller: fullNameController,
              hintText: 'Full Name',
              obscureText: false,
            ),
          ),
          SizedBox(height: 15.h),
          // Email field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
          ),
          SizedBox(height: 15.h),
          // Password field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
          ),
          SizedBox(height: 15.h),
          // Phone number field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: MyTextField(
              controller: phoneController,
              hintText: 'Phone Number',
              obscureText: false,
            ),
          ),
          SizedBox(height: 25.h),
          // Sign up button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: MyButtonSignUp(
              onTap: signUpUser,
            ),
          ),
          SizedBox(height: 20.h),
          // Or Continue with divider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(width: 10.w),
                Text('Or Continue with'),
                SizedBox(width: 10.w),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          // Google + Apple sign in
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Google icon
              SquareTile(imagePath: 'assets/google.png'),
              SizedBox(width: 25),
              // Apple icon
              SquareTile(imagePath: 'assets/apple.png'),
            ],
          ),
          SizedBox(height: 20.h),
          // Already have an account text
          GestureDetector(
            onTap: () {
              // Navigate to the login page when the "Log In" text is pressed
              Navigator.of(context).push(_createRouteForLogin());
            },
            child: RichText(
              text: TextSpan(
                text: "Already have an account ? ",
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log In',
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

  Route _createRouteForLogin() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LogIn(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start from bottom
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
