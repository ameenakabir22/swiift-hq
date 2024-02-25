import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 10.h,
            ),

            // sign up text
            Text(
              'Sign Up',
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600),
            ),

            SizedBox(
              height: 30.h,
            ),

            // Sign up text
            Text(
              "Create your Account",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Bold',
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.h),
            // Full name field
            MyTextField(
              controller: fullNameController,
              hintText: 'Full Name',
              obscureText: false,
            ),
            SizedBox(height: 10.h),
            // Email field
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: 10.h),
            // Password field
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 10.h),
            // Phone number field
            MyTextField(
              controller: phoneController,
              hintText: 'Phone Number',
              obscureText: false,
            ),
            SizedBox(height: 30.h),
            // Sign up button
            MyButton(
              onTap: signUpUser, // Pass function reference without parentheses
            ),
            SizedBox(height: 50),
            Padding(
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
                    width: 20.w,
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
            SizedBox(
              height: 30.h,
            ),

            // google + apple sign in
            Row(
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
            SizedBox(
              height: 35.h,
            ),
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
            // blob 2
          ],
        ),
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
