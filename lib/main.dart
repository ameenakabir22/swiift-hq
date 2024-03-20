import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiift/firebase_options.dart';
import 'package:swiift/pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    print('Firebase initialized successfully');
  } catch (e) {
    // Print any errors that occur during initialization
    print('Error initializing Firebase: $e');
  }

  // Run the app
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
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
