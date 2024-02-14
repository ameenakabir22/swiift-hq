import 'package:flutter/material.dart';

import '../pages/signup.dart';

class MyTabletBody extends StatefulWidget {
  const MyTabletBody({Key? key}) : super(key: key);

  @override
  State<MyTabletBody> createState() => _MyTabletBodyState();
}

class _MyTabletBodyState extends State<MyTabletBody> {
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
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60, top: 60),
                          child: Text(
                            'Sign Up To Deliver',
                            style: TextStyle(
                                fontSize: 45, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.only(top: 90.0, right: 27),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                // adds a faint border
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 100),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade400, // Light grey color
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60.0, top: 120),
                        child: Text(
                          'Sign Up For Swift Deliveries',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, right: 30),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 80,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 150),
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
