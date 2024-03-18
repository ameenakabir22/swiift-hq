import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/pages/homepage.dart';
import 'package:swiift/pages/login.dart';
import 'package:swiift/pages/signup.dart';
import 'package:swiift/pages/splashscreen.dart';
import 'package:swiift/pages/homepage.dart'; // Import the home screen file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Swiift());
}

class Swiift extends StatelessWidget {
  const Swiift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Your App Title',
          initialRoute: '/login',
          routes: {
            '/login': (context) => LogIn(),
            '/signup': (context) => SignUp(),
            '/home': (context) =>
                HomePage(), // Add this route for the home screen
          },
        );
      },
    );
  }
}
