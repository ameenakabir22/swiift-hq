import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';
import 'package:swiift/components/square_tile.dart';
import 'package:swiift/pages/homepage.dart';
import 'package:swiift/pages/signup.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String emailError = '';
  String passwordError = '';

  void handleTextFieldChange(String value, String error, String field) {
    setState(() {
      if (field == 'email') {
        emailError = error;
      } else if (field == 'password') {
        passwordError = error;
      }
    });
  }

  bool formValidation() {
    bool isValid = true;

    if (emailController.text.isEmpty) {
      emailError = 'Please enter your email';
      isValid = false;
    } else if (!isValidEmail(emailController.text)) {
      emailError = 'Please enter a valid email address';
      isValid = false;
    } else {
      emailError = '';
    }

    if (passwordController.text.isEmpty) {
      passwordError = 'Please enter your password';
      isValid = false;
    } else if (passwordController.text.length < 8) {
      passwordError = 'Password must be at least 8 characters long';
      isValid = false;
    } else {
      passwordError = '';
    }

    return isValid;
  }

  bool isValidEmail(String email) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(email);
  }

  void signUserIn(BuildContext context) async {
    if (formValidation()) {
      // Simulate authentication (replace this with actual authentication code)
      bool isAuthenticated = true;

      if (isAuthenticated) {
        // Navigate to home page on successful authentication
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Show error message if authentication fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Authentication failed. Please try again.')),
        );
      }
    }
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
            Transform.translate(
              offset: Offset(-150.w, 10.h),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
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
            Transform.translate(
              offset: Offset(0.0, -70.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    controller: emailController,
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
            Transform.translate(
              offset: Offset(0.0, -70.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    controller: passwordController,
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
            Transform.translate(
              offset: Offset(0.0, -50.h),
              child: MyButton(onTap: () {
                signUserIn(context);
              }),
            ),
            SizedBox(height: 50.h),
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
            Transform.translate(
              offset: Offset(0.0, -15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SquareTile(imagePath: 'assets/google.png'),
                  SizedBox(
                    width: 25,
                  ),
                  SquareTile(
                    imagePath: 'assets/apple.png',
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
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
                        color: Colors.black,
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

  Route _createRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
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
