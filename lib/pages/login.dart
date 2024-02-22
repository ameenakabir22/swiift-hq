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
    return LogInContainer();
  }
}
