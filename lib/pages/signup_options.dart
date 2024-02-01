import 'package:flutter/material.dart';
import 'package:swiift/pages/signup.dart';

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
      body: Column(
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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Sign Up To Deliver',
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 15),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                // adds a faint border
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
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
                        padding: const EdgeInsets.only(left: 30.0, top: 50),
                        child: Text(
                          'Sign Up For Swift Deliveries',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 33, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 10),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
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
