import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';
import 'package:swiift/components/square_tile.dart';
import 'package:swiift/pages/signup.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // Text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Error messages
  String emailError = '';
  String passwordError = '';

  void handleTextFieldChange(String value, String error, String field) {
    setState(() {
      if (field == 'email') {
        emailError = ''; // Clear error message
      } else if (field == 'password') {
        passwordError = ''; // Clear error message
      }
    });
  }

  // Validate and sign in user
  void signInUser() {
    // Validate email
    if (_emailController.text.isEmpty) {
      setState(() {
        emailError = 'Please enter your email';
      });
      return;
    } else if (!isValidEmail(_emailController.text)) {
      setState(() {
        emailError = 'Please enter a valid email address';
      });
      return;
    } else {
      setState(() {
        emailError = ''; // Clear error message
      });
    }

    // Validate password
    if (_passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Please enter your password';
      });
      return;
    } else if (_passwordController.text.length < 8) {
      setState(() {
        passwordError = 'Password must be at least 8 characters long';
      });
      return;
    } else {
      setState(() {
        passwordError = ''; // Clear error message
      });
    }
  }

  bool isValidEmail(String email) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(email);
  }

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void Dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Back button
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
            // Logo
            Transform.translate(
              offset: Offset(0.0, -30.h),
              child: Center(
                child: Container(
                  width: 200.h,
                  height: 200.w,
                  child: Image.asset(
                    'assets/swiiftlogo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Log in text
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
            SizedBox(height: 25.h),

            // Email field with error message
            Transform.translate(
              offset: Offset(0.0, -70.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    obscureText: false,
                    onChanged: (value) {
                      handleTextFieldChange(value, emailError, 'email');
                    },
                  ),
                  if (emailError.isNotEmpty)
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, top: 5.h, bottom: 5.h),
                      child: Text(
                        emailError,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 15.h),

            // Password field with error message
            Transform.translate(
              offset: Offset(0.0, -70.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    onChanged: (value) {
                      handleTextFieldChange(value, passwordError, 'password');
                    },
                  ),
                  if (passwordError.isNotEmpty)
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, top: 5.h, bottom: 5.h),
                      child: Text(
                        passwordError,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Forgot password text
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
            SizedBox(height: 10.h),

            // Sign in button
            Transform.translate(
              offset: Offset(0.0, -50.h),
              child: MyButton(
                onTap: signInUser,
              ),
            ),
            SizedBox(height: 50.h),

            // Or continue with text
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
            SizedBox(height: 5.h),

            // Google and Apple sign in
            Transform.translate(
              offset: Offset(0.0, -15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Google icon
                  SquareTile(imagePath: 'assets/google.png'),
                  SizedBox(
                    width: 25,
                  ),
                  // Apple icon
                  SquareTile(
                    imagePath: 'assets/apple.png',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Don't have an account text
            GestureDetector(
              onTap: () {
                // Navigate to the sign up page when the "Sign Up" text is pressed
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
      ),
    );
  }

  // Navigate to sign up page transition
  Route _createRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
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
