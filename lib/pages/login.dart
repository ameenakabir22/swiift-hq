import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/components/login_container.dart';
import 'package:swiift/components/my_button.dart';
import 'package:swiift/components/my_textfield.dart';
import 'package:swiift/components/square_tile.dart';

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
      body: Stack(
        children: [
          /*  Image.asset(
            'assets/loginbackground.jpg',
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(15.0),
              left: ScreenUtil().setWidth(15.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigate back to the previous page when the back arrow is pressed
                Navigator.pop(context);
              },
            ),
          ), */
          // log in container
          LogInContainer(),
        ],
      ),
    );
  }
}
