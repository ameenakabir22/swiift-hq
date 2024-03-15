import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/my_button_signup.dart';
import 'package:swiift/components/my_textfield.dart';
import 'package:swiift/components/square_tile.dart';
import 'package:swiift/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Define text editing controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  // Define error messages
  String fullNameError = '';
  String emailError = '';
  String passwordError = '';
  String phoneError = '';

  // Method to handle text field value changes and clear error message
  void handleTextFieldChange(String value, String error, String field) {
    setState(() {
      switch (field) {
        case 'full_name':
          fullNameError = ''; // Clear error message
          break;
        case 'email':
          emailError = ''; // Clear error message
          break;
        case 'password':
          passwordError = ''; // Clear error message
          break;
        case 'phone':
          phoneError = ''; // Clear error message
          break;
      }
    });
  }

  // Validate and sign up user
  void signUpUser() {
    // Validation
    if (fullNameController.text.isEmpty) {
      setState(() {
        fullNameError = 'Please enter your full name';
      });
      return;
    } else {
      setState(() {
        fullNameError = ''; // Clear error message
      });
    }

    // Validate email
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = 'Please enter your email';
      });
      return;
    } else if (!isValidEmail(emailController.text)) {
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
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password';
      });
      return;
    } else if (passwordController.text.length < 8) {
      setState(() {
        passwordError = 'Password must be at least 8 characters long';
      });
      return;
    } else {
      setState(() {
        passwordError = ''; // Clear error message
      });
    }

    // Validate phone number
    if (phoneController.text.isEmpty) {
      setState(() {
        phoneError = 'Please enter your phone number';
      });
      return;
    } else if (!isValidPhoneNumber(phoneController.text)) {
      setState(() {
        phoneError = 'Please enter a valid phone number';
      });
      return;
    } else {
      setState(() {
        phoneError = ''; // Clear error message
      });
    }

    // If all validations pass, proceed with sign up
    // Perform sign-up operation using provided details
    // Your sign-up logic here...
  }

  // Check if email is valid
  bool isValidEmail(String email) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(email);
  }

  // Check if phone number is valid
  bool isValidPhoneNumber(String phoneNumber) {
    final phonePattern = RegExp(r'^((\+?234)|0)([789]0|[789]1)([0-9]{8})$');
    return phonePattern.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

            // Sign up text
            Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: 30.h,
            ),

            // Create account text
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

            // Full name field with error message
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextField(
                  controller: fullNameController,
                  hintText: 'Full Name',
                  obscureText: false,
                  onChanged: (value) {
                    handleTextFieldChange(value, fullNameError, 'full_name');
                  },
                ),
                if (fullNameError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 5.h, bottom: 5.h),
                    child: Text(
                      fullNameError,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),

            // Email field with error message
            Column(
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
                    padding: EdgeInsets.only(left: 25.w, top: 5.h, bottom: 5.h),
                    child: Text(
                      emailError,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            // Password field with error message
            Column(
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
                    padding: EdgeInsets.only(left: 25.w, top: 5.h, bottom: 5.h),
                    child: Text(
                      passwordError,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),

            // Phone number field with error message
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextField(
                  controller: phoneController,
                  hintText: 'Phone Number',
                  obscureText: false,
                  onChanged: (value) {
                    handleTextFieldChange(value, phoneError, 'phone');
                  },
                ),
                if (phoneError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 5.h, bottom: 5.h),
                    child: Text(
                      phoneError,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 30.h),

            // Sign up button
            MyButtonSignUp(
              onTap: signUpUser,
            ),

            SizedBox(height: 40.h),

            // Or continue with text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
              height: 20.h,
            ),

            // Google and Apple sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google icon
                SquareTile(imagePath: 'assets/google.png'),
                SizedBox(
                  width: 25.w,
                ),
                // Apple icon
                SquareTile(
                  imagePath: 'assets/apple.png',
                ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),

            // Log in text
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
      ),
    );
  }

  // Navigate to login page transition
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
