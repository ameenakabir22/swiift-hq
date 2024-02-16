import 'package:flutter/material.dart';
import 'package:swiift/pages/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
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
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the SignUp page when either the text or icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Column(
              children: [
                // the row containing the options
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 80.0.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Sign Up To Deliver',
                          style: TextStyle(
                            fontSize: 33.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 40.sp,
                      ),
                    ],
                  ),
                ),
                // adds a faint border
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade400, // Light grey color
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Sign Up For Swift Deliveries',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 33.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 40.sp,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade400, // Light grey color
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
